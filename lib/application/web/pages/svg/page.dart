import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'action.dart';
import 'export.dart';
import 'source.dart';
import 'svgeditor.dart';
import 'svgviewer.dart';

class WSvgPage extends ConsumerStatefulWidget {
  const WSvgPage({super.key});

  @override
  ConsumerState<WSvgPage> createState() => _DPasswordPageState();
}

class _DPasswordPageState extends ConsumerState<WSvgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(
              children: [
                WFromSourcePartial(),
                WSvgEditorPartial(),
                WSvgViewerPartial(),
                WSvgActionPartial(),
                WSvgExportPartial()
              ],
            ),
          ))
        ],
      ),
    )));
  }
}
