import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/web/theme.dart';

class WSvgExportPartial extends ConsumerWidget {
  const WSvgExportPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: STWebAppTheme.rootFontSize * 40,
      height: STWebAppTheme.rootFontSize * 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {},
            child: const Text('PNG下载'),
          ),
          SizedBox(
            width: STWebAppTheme.rootFontSize,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('JPG下载'),
          ),
          SizedBox(
            width: STWebAppTheme.rootFontSize,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('WebP下载'),
          ),
          SizedBox(
            width: STWebAppTheme.rootFontSize,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('SVG下载'),
          ),
          SizedBox(
            width: STWebAppTheme.rootFontSize,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('复制SVG代码'),
          )
        ],
      ),
    );
  }
}
