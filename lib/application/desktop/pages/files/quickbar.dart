import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:suzaku/application/components/loading.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';

class SKFileQuickbarView extends ConsumerStatefulWidget {
  const SKFileQuickbarView({super.key});

  @override
  ConsumerState<SKFileQuickbarView> createState() => _SKFileQuickbarViewState();
}

class _SKFileQuickbarViewState extends ConsumerState<SKFileQuickbarView> {
  _SKFileQuickbarViewState();

  @override
  Widget build(BuildContext context) {
    var currentLocation = ref.watch(glLocationProvider);
    if (currentLocation == null) {
      return const VSLoading();
    }
    return Container(
      height: 32,
      padding: EdgeInsets.only(left: 16, right: 16),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(glLocationProvider.notifier).update((state) =>
                          SKGlobalLocationNavigator.instance.upward());
                    },
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: 270 * math.pi / 180,
                      child: Icon(
                        Symbols.cut,
                        size: 20,
                        color: const Color(0xff333333),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              spacing: 8,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(listOrGridProvider.notifier)
                          .update((state) => "list");
                    },
                    child: Icon(
                      Symbols.account_tree,
                      size: 20,
                      color: const Color(0xff333333),
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(listOrGridProvider.notifier)
                          .update((state) => "grid");
                    },
                    child: Icon(
                      Symbols.grid_on,
                      size: 20,
                      color: const Color(0xff333333),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
