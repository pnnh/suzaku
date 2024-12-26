import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/web/layout/size.dart';
import 'package:suzaku/models/svg/state.dart';

class WSvgEditorPartial extends ConsumerWidget {
  const WSvgEditorPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: STAppTheme.rootFontSize * 24,
      height: STAppTheme.rootFontSize * 12,
      padding: EdgeInsets.all(0),
      child: TextField(
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: OutlineInputBorder(),
          labelText: '输入SVG文本',
        ),
        style: TextStyle(fontSize: STAppTheme.rootFontSize),
        onChanged: (value) {
          ref.read(svgModelStateProvider.notifier).setText(value);
        },
      ),
    );
  }
}
