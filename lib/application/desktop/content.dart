import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:quantum/utils/color.dart';
import 'package:suzaku/application/desktop/theme.dart';

import 'content/list.dart';
import 'content/preview.dart';

class YTWebContentWidget extends ConsumerWidget {
  const YTWebContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: YTWebContentSplitWidget(),
    );
  }
}

class YTWebContentSplitWidget extends ConsumerStatefulWidget {
  const YTWebContentSplitWidget({super.key});

  @override
  YTWebContentSplitWidgetState createState() => YTWebContentSplitWidgetState();
}

class YTWebContentSplitWidgetState
    extends ConsumerState<YTWebContentSplitWidget> {
  final MultiSplitViewController _controller = MultiSplitViewController();

  @override
  void initState() {
    super.initState();
    _controller.areas = [
      Area(
          data: generateRandomColor(),
          flex: 1,
          min: YTWebTheme.rootFontSize * 20),
      Area(
          data: generateRandomColor(),
          size: YTWebTheme.rootFontSize * 40,
          max: YTWebTheme.rootFontSize * 60,
          min: YTWebTheme.rootFontSize * 20),
    ];
    _controller.addListener(_rebuild);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_rebuild);
  }

  void _rebuild() {
    setState(() {
      // rebuild to update empty text and buttons
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? content;
    MultiSplitView multiSplitView = MultiSplitView(
      controller: _controller,
      axis: Axis.vertical,
      pushDividers: true,
      dividerBuilder: (Axis axis, int index, bool resizable, bool dragging,
              bool highlighted, MultiSplitViewThemeData themeData) =>
          Container(
        color: highlighted ? Color(0xFFdddddd) : Color(0xFFeeeeee),
      ),
      builder: (BuildContext context, Area area) => area.index == 0
          ? YTWebContentListWidget()
          : YTWebContentPreviewWidget(),
    );

    content = Padding(
        padding: const EdgeInsets.all(0),
        child: MultiSplitViewTheme(
            data: MultiSplitViewThemeData(
                dividerThickness: 3,
                dividerPainter: DividerPainters.grooved2()),
            child: multiSplitView));

    return Container(child: content);
  }
}
