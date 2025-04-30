import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart';
import 'package:quantum/filesystem/file.dart';
import 'package:quantum/utils/logger.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';
import 'package:suzaku/services/folder.dart';
import 'package:suzaku/services/location.dart';

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
                color: const Color(0xffEDEBEA),
                border: Border(
                  right: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: const Color(0xffe3e3e3), width: 0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("位置"),
                        GestureDetector(
                          onTap: () async {
                            var selectedPath = await QMFileModel.chooseFiles();
                            debugPrint("selectedPath $selectedPath");
                            if (selectedPath != null) {
                              var model =
                                  SKLocationModel.fromPath(selectedPath);
                              await SKLocationModel.insertFolder(model);
                              ref
                                  .read(filesPageStateProvider.notifier)
                                  .reloadLocations(selectedPath ?? "");
                            }
                          },
                          child: Icon(Symbols.add),
                        )
                      ],
                    ),
                  ),
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
    var filesPageState = ref.watch(filesPageStateProvider);
    debugPrint("filesPageState build");
    return switch (filesPageState) {
      AsyncData(:final value) => Column(
          children: [
            Column(
                children: List.generate(
              value.locationList.length,
              (index) {
                var item = value.locationList[index];

                return MouseRegion(
                    child: Container(
                  height: 32,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  color: Colors.transparent,
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        ref.read(glLocationProvider.notifier).update((state) =>
                            SKGlobalLocationNavigator.instance
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
        ),
      AsyncError(:final error) => Text('error: $error'),
      _ => const Text('loading'),
    };
  }
}
