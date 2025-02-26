import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quantum/filesystem/file.dart';
import 'package:suzaku/application/components/arrow.dart';
import 'package:suzaku/application/components/loading.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';

final StateProvider<String> _activeItem = StateProvider((_) => "");

class SKFileListView extends ConsumerStatefulWidget {
  const SKFileListView({super.key});

  @override
  ConsumerState<SKFileListView> createState() => _SKFileListViewState();
}

class _SKFileListViewState extends ConsumerState<SKFileListView> {
  final ScrollController _vCtrl = ScrollController();

  _SKFileListViewState();

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
        future: QMFileModel.selectFilesFromPath(currentLocation.realPath),
        builder:
            (BuildContext context, AsyncSnapshot<List<QMFileModel>> snapshot) {
          var fileModels = snapshot.data;
          if (fileModels == null) {
            return const VSLoading();
          }

          return Container(
            child: Column(
              children: [
                Container(
                  height: 32,
                  padding: EdgeInsets.only(left: 32, right: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 64,
                        child: Text(
                          "名称",
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 14, color: const Color(0xff333333)),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 64,
                        child: Text(
                          "类型",
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 14, color: const Color(0xff333333)),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          "修改时间",
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 14, color: const Color(0xff333333)),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 64,
                        child: Text(
                          "大小",
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 14, color: const Color(0xff333333)),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: fileModels.map((fileModel) {
                            return _ItemWidget(fileModel);
                          }).toList(),
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ItemWidget extends ConsumerWidget {
  final QMFileModel fileModel;
  final int level;
  final StateProvider<bool> openSub = StateProvider<bool>((_) => false);

  _ItemWidget(this.fileModel, {this.level = 0, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            _ItemTitleWidget(
              fileModel,
              openSub,
              level: this.level,
            ),
            _ItemChildrenWidget(fileModel, openSub, level: this.level),
          ],
        ));
  }
}

class _ItemTitleWidget extends ConsumerWidget {
  final QMFileModel fileModel;
  final StateProvider<bool> openSub;
  final int level;

  const _ItemTitleWidget(this.fileModel, this.openSub,
      {this.level = 0, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      child: Container(
        color: ref.watch(_activeItem) == fileModel.uid
            ? const Color(0xFFF2F2F2)
            : Colors.transparent,
        padding: EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16),
        child: Row(
          children: [
            SizedBox(
              width: this.level * 16,
            ),
            GestureDetector(
              child: this.fileModel.isFolder
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
              child: Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    "static/images/icons/${fileModel.isFolder ? "folder" : "file"}.svg",
                    color: const Color(0xffCDCDCD),
                    height: 16,
                    width: 16,
                    //    fit: BoxFit.fitWidth
                  ),
                  SizedBox(
                      width: 120,
                      child: Text(
                        fileModel.name,
                        softWrap: false,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                  SizedBox(
                    width: 96,
                    child: Text(fileModel.fileMime,
                        softWrap: false,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 12, color: const Color(0xff333333)),
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(fileModel.lastModifiedString,
                        softWrap: false,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12, color: const Color(0xff333333)),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    width: 96,
                    child: Text(
                      fileModel.fileSizeString,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 12, color: const Color(0xff333333)),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
            )
          ],
        ),
      ),
      onEnter: (event) {
        ref.read(_activeItem.notifier).update((state) => fileModel.uid);
      },
      onExit: (event) {
        ref.read(_activeItem.notifier).update((state) => "");
      },
    );
  }
}

class _ItemChildrenWidget extends ConsumerWidget {
  final QMFileModel fileModel;
  final int level;
  final StateProvider<bool> openSub;

  const _ItemChildrenWidget(this.fileModel, this.openSub,
      {this.level = 0, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var open = ref.watch(openSub);
    if (!open) {
      return Container();
    }
    return FutureBuilder<List<QMFileModel>>(
      future: QMFileModel.selectFilesFromPath(fileModel.path),
      builder:
          (BuildContext context, AsyncSnapshot<List<QMFileModel>> snapshot) {
        var subFileModels = snapshot.data ?? [];
        return Container(
            child: Column(
                children: subFileModels
                    .map((e) => _ItemWidget(
                          e,
                          level: this.level + 1,
                        ))
                    .toList()));
      },
    );
  }
}
