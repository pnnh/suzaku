import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme.dart';

class YTWebNavbarWidget extends ConsumerWidget {
  const YTWebNavbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: YTWebTheme.rootFontSize * 16,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(YTWebTheme.rootFontSize / 2),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
            ),
            child: Text('位置', style: TextStyle(
              fontSize: YTWebTheme.rootFontSize * 1.1,
              fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
            ),
            padding: EdgeInsets.all(YTWebTheme.rootFontSize / 2),
            child: Text('主目录', style: TextStyle(
              fontSize: YTWebTheme.rootFontSize,
            )),
          ),
        ],
      ),
    );
  }
}
