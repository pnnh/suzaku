import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/pages/common/size.dart';
import 'package:suzaku/application/pages/web/source.dart';
import 'package:suzaku/application/pages/web/svgeditor.dart';
import 'package:suzaku/application/pages/web/svgviewer.dart';

import 'action.dart';
import 'appbar.dart';
import 'export.dart';

class WHomePage extends ConsumerWidget {
  const WHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: WAppBarPartial(),
      body: SafeArea(
        child: WAppBodyPartial(),
      ),
    );
  }
}

class WAppBodyPartial extends ConsumerWidget {
  const WAppBodyPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      child: Column(
        children: [
          WFromSourcePartial(),
          SizedBox(
            height: STAppTheme.rootFontSize,
          ),
          WSvgEditorPartial(),
          SizedBox(
            height: STAppTheme.rootFontSize,
          ),
          WSvgViewerPartial(),
          SizedBox(
            height: STAppTheme.rootFontSize,
          ),
          WSvgActionPartial(),
          SizedBox(
            height: STAppTheme.rootFontSize,
          ),
          WSvgExportPartial()
        ],
      ),
    );
  }
}
