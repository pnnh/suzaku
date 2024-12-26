import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/web/theme.dart';

class WFromSourcePartial extends ConsumerWidget {
  const WFromSourcePartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {},
            child: const Text('预览文本'),
          ),
          SizedBox(
            width: STWebAppTheme.rootFontSize,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('上传文件'),
          )
        ],
      ),
    );
  }
}
