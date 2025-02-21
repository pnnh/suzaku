import 'dart:math';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';
import 'package:suzaku/models/file.dart';

import 'package:suzaku/services/folder.dart';
import 'package:suzaku/services/location.dart';
import 'package:suzaku/utils/logger.dart';

class DFoldersBody extends StatelessWidget {
  const DFoldersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FoldersBodyState();
  }
}

class _FoldersBodyState extends ConsumerWidget {
  const _FoldersBodyState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Size screenSize = MediaQuery.of(context).size;
        logger.d("screenSize $screenSize");

        return ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              height: max(512, constraints.maxHeight), width: 256),
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
                  const _MFoldersPartial(),
                ],
              )), // your column
        );
      },
    );
  }
}

class _MFoldersPartial extends ConsumerWidget {
  const _MFoldersPartial();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<SKLocationModel>>(
        future: selectLocations(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("加载Folders出错"),
            );
          }
          var dataList = snapshot.data as List<SKLocationModel>;
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
                          ref.read(glLocationProvider.notifier).update(
                              (state) => SKGlobalLocationNavigator.instance
                                  .initialLocation(item.realPath));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
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
                                Text(
                                  basename(item.realPath),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
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
