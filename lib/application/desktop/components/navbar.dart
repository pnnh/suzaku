import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../pages/files/state.dart';

class DNavbarComponent extends ConsumerWidget {
  const DNavbarComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var globalLocation = ref.watch(glLocationProvider);
    if (globalLocation == null) {
      return Container();
    }
    return Container(
      height: 32,
      padding: const EdgeInsets.only(left: 8, right: 8),
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
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {
                context.go("/tools");
              },
              child: Icon(
                Symbols.globe,
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
                ref.read(glLocationProvider.notifier).update(
                    (state) => SKGlobalLocationNavigator.instance.back());
              },
              child: Icon(
                Symbols.arrow_back,
                size: 20,
                color: globalLocation.isRoot
                    ? const Color(0xffcccccc)
                    : const Color(0xff333333),
              ),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {
                ref.read(glLocationProvider.notifier).update(
                    (state) => SKGlobalLocationNavigator.instance.forward());
              },
              child: Icon(
                Symbols.arrow_forward,
                size: 20,
                color: globalLocation.isLeaf
                    ? const Color(0xffcccccc)
                    : const Color(0xff333333),
              ),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {
                ref.read(glLocationProvider.notifier).update(
                    (state) => SKGlobalLocationNavigator.instance.upward());
              },
              child: Icon(
                Symbols.arrow_upward,
                size: 20,
                color: globalLocation.isRoot
                    ? const Color(0xffcccccc)
                    : const Color(0xff333333),
              ),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Symbols.refresh,
                size: 20,
                color: const Color(0xff333333),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 24,
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffdadada),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        globalLocation.showPath,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Symbols.star,
                            size: 20,
                            color: const Color(0xff333333),
                          ),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Symbols.edit_document,
                            size: 20,
                            color: const Color(0xff333333),
                          ),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Symbols.folder_managed,
                            size: 20,
                            color: const Color(0xff333333),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 240,
            height: 24,
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffdadada),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "搜索",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff333333),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
