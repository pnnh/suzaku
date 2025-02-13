import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/components/arrow.dart';
import 'package:suzaku/application/components/loading.dart';
import 'package:suzaku/application/desktop/pages/files/folders.dart';
import 'package:suzaku/models/file.dart';

import 'package:suzaku/services/file.dart';
import 'package:suzaku/services/location.dart';

import '../notes/library.dart';

final StateProvider<String> _activeItem = StateProvider((_) => "");

class SKFileListView extends ConsumerStatefulWidget {
  const SKFileListView({super.key});

  @override
  ConsumerState<SKFileListView> createState() => _VSAlbumWidgetState();
}

class _VSAlbumWidgetState extends ConsumerState<SKFileListView> {
  final ScrollController _vCtrl = ScrollController();

  _VSAlbumWidgetState();

  /// 计算文字宽度
  double calculateText(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style));
    textPainter.layout();
    return textPainter.width;
  }

  @override
  void dispose() {
    _vCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentLocation = ref.watch(glLocationProvider);
    if (currentLocation == null) {
      return const VSLoading();
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: FutureBuilder(
        future: selectFiles(currentLocation),
        builder:
            (BuildContext context, AsyncSnapshot<List<SKFileModel>> snapshot) {
          var albumModels = snapshot.data;
          if (albumModels == null) {
            return const VSLoading();
          }

          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: albumModels.map((album) {
                  return _ItemWidget(album);
                }).toList(),
              ));
        },
      ),
    );
  }
}

class _ItemWidget extends ConsumerWidget {
  final SKFileModel albumModel;
  final int level;
  final StateProvider<bool> openSub = StateProvider<bool>((_) => false);

  _ItemWidget(this.albumModel, {this.level = 0, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<SKFileModel>>(
      future: selectSubDirectories(albumModel),
      builder:
          (BuildContext context, AsyncSnapshot<List<SKFileModel>> snapshot) {
        var subAlbumModels = snapshot.data;
        var showSubModels = ref.watch(openSub) ? subAlbumModels ?? [] : [];
        return Container(
            child: Column(
          children: [
            _ItemTitleWidget(
              albumModel,
              openSub,
              subAlbumModels ?? [],
              level: this.level,
            ),
            ...showSubModels
                .map((e) => _ItemWidget(
                      e,
                      level: this.level + 1,
                    ))
                .toList()
          ],
        ));
      },
    );
  }
}

class _ItemTitleWidget extends ConsumerWidget {
  final SKFileModel albumModel;
  final StateProvider<bool> openSub;
  final int level;
  final List<SKFileModel> subAlbumModels;

  const _ItemTitleWidget(this.albumModel, this.openSub, this.subAlbumModels,
      {this.level = 0, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      child: Container(
        color: ref.watch(_activeItem) == albumModel.uid
            ? const Color(0xFFF2F2F2)
            : Colors.transparent,
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
        child: Row(
          children: [
            SizedBox(
              width: this.level * 16,
            ),
            GestureDetector(
              child: this.subAlbumModels.length > 0
                  ? VSArrowWidget(transform: ref.watch(openSub) ? 0 : -90)
                  : SizedBox(
                      height: 16,
                      width: 16,
                    ),
              onTap: () {
                ref.read(openSub.notifier).update((state) => !state);
              },
            ),
            GestureDetector(
              child: SizedBox(
                  width: 120,
                  child: Text(
                    albumModel.name,
                    softWrap: false,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              onTap: () {
                // ref
                //     .read(albumModelProvider.notifier)
                //     .update((state) => albumModel);
              },
            )
          ],
        ),
      ),
      onEnter: (event) {
        ref.read(_activeItem.notifier).update((state) => albumModel.uid);
      },
      onExit: (event) {
        ref.read(_activeItem.notifier).update((state) => "");
      },
    );
  }
}
