import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:suzaku/services/notes/notebook.dart';
import 'package:suzaku/utils/logger.dart';

import 'library_view.dart';

class SKLibraryNotebookView extends ConsumerStatefulWidget {
  final String libraryPath;

  const SKLibraryNotebookView(this.libraryPath, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SKLibraryNotebookViewState();
  }
}

class _SKLibraryNotebookViewState extends ConsumerState<SKLibraryNotebookView> {
  _SKLibraryNotebookViewState();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Size screenSize = MediaQuery.of(context).size;
        logger.d("screenSize $screenSize");

        return ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              height: max(512, constraints.maxHeight), width: 240),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  _MFoldersPartial(widget.libraryPath),
                ],
              )), // your column
        );
      },
    );
  }
}

class _MFoldersPartial extends ConsumerWidget {
  final String libraryPath;

  const _MFoldersPartial(this.libraryPath, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<SKNotebookModel>>(
        future: selectNotebooks(libraryPath),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("加载SKNotebookModel出错"),
            );
          }
          var dataList = snapshot.data as List<SKNotebookModel>;
          return Column(
            children: [
              Column(
                  children: List.generate(
                dataList.length,
                (index) {
                  var item = dataList[index];

                  return MouseRegion(
                      child: Container(
                    height: 32,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    color: Colors.transparent,
                    child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          ref
                              .read(glNotebookProvider.notifier)
                              .update((state) => item);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.only(
                                  left: 0, right: 8, top: 0, bottom: 0),
                              child: SvgPicture.asset(
                                "static/images/icons/folder.svg",
                                color: const Color(0xff444444),
                                height: 16,
                                width: 16,
                                //    fit: BoxFit.fitWidth
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: Text(
                                basename(item.realPath),
                                style: const TextStyle(fontSize: 12),
                                softWrap: false,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          ],
                        )),
                  ));
                },
              ))
            ],
          );
        });
  }
}
