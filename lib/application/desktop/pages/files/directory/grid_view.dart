import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quantum/utils/image.dart';
import 'package:suzaku/application/components/arrow.dart';
import 'package:suzaku/application/components/loading.dart';
import 'package:suzaku/application/desktop/pages/files/directory/folders.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';
import 'package:suzaku/models/file.dart';

import 'package:suzaku/services/file.dart';
import 'package:suzaku/services/location.dart';

final StateProvider<String> _activeItem = StateProvider((_) => "");

class SKFileGridView extends ConsumerStatefulWidget {
  const SKFileGridView({super.key});

  @override
  ConsumerState<SKFileGridView> createState() => _SKFileGridViewState();
}

class _SKFileGridViewState extends ConsumerState<SKFileGridView> {
  final ScrollController _vCtrl = ScrollController();

  _SKFileGridViewState();

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
        future: selectFilesFromPath(currentLocation.realPath),
        builder:
            (BuildContext context, AsyncSnapshot<List<SKFileModel>> snapshot) {
          var fileModels = snapshot.data;
          if (fileModels == null) {
            return const VSLoading();
          }

          return Container(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 6,
              children: fileModels.map((fileModel) {
                return _ItemWidget(fileModel);
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class _ItemWidget extends ConsumerWidget {
  final SKFileModel fileModel;

  _ItemWidget(this.fileModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      child: Container(
          color: ref.watch(_activeItem) == fileModel.uid
              ? const Color(0xFFF2F2F2)
              : Colors.transparent,
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: _ItemPreviewWidget(fileModel),
              )),
              _ItemTitleWidget(
                fileModel,
              ),
            ],
          )),
      onEnter: (event) {
        ref.read(_activeItem.notifier).update((state) => fileModel.uid);
      },
      onExit: (event) {
        ref.read(_activeItem.notifier).update((state) => "");
      },
    );
  }
}

class _ItemTitleWidget extends ConsumerWidget {
  final SKFileModel fileModel;

  const _ItemTitleWidget(this.fileModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16),
      child: Row(
        spacing: 0,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GestureDetector(
            child: Text(
              fileModel.name,
              softWrap: false,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            onTap: () {
              // ref
              //     .read(albumModelProvider.notifier)
              //     .update((state) => albumModel);
            },
            onDoubleTap: () {
              if (!fileModel.isFolder) {
                return;
              }
              ref.read(glLocationProvider.notifier).update((state) =>
                  SKGlobalLocationNavigator.instance
                      .newLocation(fileModel.path));
            },
          ))
        ],
      ),
    );
  }
}

class _ItemPreviewWidget extends ConsumerWidget {
  final SKFileModel fileModel;

  _ItemPreviewWidget(this.fileModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isImage(fileModel.path)) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.file(
          File(fileModel.path),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
    }
    return Icon(
      fileModel.isFolder ? Symbols.folder_open : Symbols.draft,
      size: fileModel.isFolder ? 80 : 72,
      color: const Color(0xff333333),
    );
  }
}
