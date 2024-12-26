import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/web/theme.dart';

import '../../layout/size.dart';

class WSvgActionPartial extends ConsumerWidget {
  const WSvgActionPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: STWebAppTheme.rootFontSize * 32,
      height: STWebAppTheme.rootFontSize * 3,
      child: Row(
        children: [
          WColorPickerPartial(),
          SizedBox(
            width: STWebAppTheme.rootFontSize,
          ),
          WSizePickerPartial(),
        ],
      ),
    );
  }
}

class WColorPickerPartial extends ConsumerWidget {
  const WColorPickerPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: STWebAppTheme.rootFontSize * 16,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: STWebAppTheme.lightBorderColor, width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Container(
            color: Colors.blueAccent,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            color: Colors.deepOrangeAccent,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            color: Colors.amberAccent,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            color: Colors.deepPurpleAccent,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            color: Colors.red,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            color: Colors.orange,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            color: Colors.teal,
            width: STWebAppTheme.rootFontSize * 1.2,
            height: STWebAppTheme.rootFontSize * 1.2,
          ),
          SizedBox(
            width: 6,
          ),
          Text("#"),
          Container(
            height: STWebAppTheme.rootFontSize * 1.5,
            width: 56,
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              maxLines: 1,
              minLines: 1,
              maxLength: 6,
              decoration: InputDecoration(
                  enabledBorder: NonUniformOutlineInputBorder(
                    hideLeftSide: true,
                    hideTopSide: true,
                    hideRightSide: true,
                    borderSide: BorderSide(
                        color: STWebAppTheme.normalBorderColor, width: 1.0),
                  ),
                  focusedBorder: NonUniformOutlineInputBorder(
                    hideLeftSide: true,
                    hideTopSide: true,
                    hideRightSide: true,
                    borderSide: BorderSide(
                        color: STWebAppTheme.normalBorderColor, width: 1.0),
                  ),
                  isDense: true,
                  counterText: "",
                  hintText: "颜色值",
                  hintStyle: TextStyle(color: STWebAppTheme.tipTextColor),
                  contentPadding:
                      EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8)),
              style: TextStyle(fontSize: STAppTheme.rootFontSize * 0.8),
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}

class WSizePickerPartial extends ConsumerWidget {
  const WSizePickerPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: STWebAppTheme.rootFontSize * 16 - STWebAppTheme.rootFontSize,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: STWebAppTheme.lightBorderColor, width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Container(
              height: STWebAppTheme.rootFontSize * 1.2,
              child: Text("16px",
                  style: TextStyle(
                    fontSize: STWebAppTheme.rootFontSize * 0.8,
                  ))),
          SizedBox(
            width: 6,
          ),
          Container(
              height: STWebAppTheme.rootFontSize * 1.2,
              child: Text("32px",
                  style: TextStyle(
                    fontSize: STWebAppTheme.rootFontSize * 0.8,
                  ))),
          SizedBox(
            width: 6,
          ),
          Container(
              height: STWebAppTheme.rootFontSize * 1.2,
              child: Text("64px",
                  style: TextStyle(
                    fontSize: STWebAppTheme.rootFontSize * 0.8,
                  ))),
          SizedBox(
            width: 6,
          ),
          Container(
              height: STWebAppTheme.rootFontSize * 1.2,
              child: Text("128px",
                  style: TextStyle(
                    fontSize: STWebAppTheme.rootFontSize * 0.8,
                  ))),
          SizedBox(
            width: 6,
          ),
          Container(
            height: STWebAppTheme.rootFontSize * 1.5,
            width: 56,
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              maxLines: 1,
              minLines: 1,
              maxLength: 4,
              decoration: InputDecoration(
                  enabledBorder: NonUniformOutlineInputBorder(
                    hideLeftSide: true,
                    hideTopSide: true,
                    hideRightSide: true,
                    borderSide: BorderSide(
                        color: STWebAppTheme.normalBorderColor, width: 1.0),
                  ),
                  focusedBorder: NonUniformOutlineInputBorder(
                    hideLeftSide: true,
                    hideTopSide: true,
                    hideRightSide: true,
                    borderSide: BorderSide(
                        color: STWebAppTheme.normalBorderColor, width: 1.0),
                  ),
                  isDense: true,
                  counterText: "",
                  hintText: "像素值",
                  hintStyle: TextStyle(color: STWebAppTheme.tipTextColor),
                  contentPadding:
                      EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8)),
              style: TextStyle(fontSize: STAppTheme.rootFontSize * 0.8),
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text("px")
        ],
      ),
    );
  }
}
