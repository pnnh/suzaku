import 'package:flutter/material.dart';

class YTWebTheme {
  static double rootFontSize = 14.0;
  static Color primaryTextColor = Color(0xFF333333);
  static Color tipTextColor = Color(0xFF888888);
  static Color primaryColor = Color(0xFF0B99FF);
  static Color normalBorderColor = Color(0xFF666666);
  static Color lightBorderColor = Color(0xFFaaaaaa);

  static final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryTextColor,
    padding: EdgeInsets.symmetric(horizontal: rootFontSize),
    shape: RoundedRectangleBorder(
      side: new BorderSide(color: normalBorderColor),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    ),
  ).copyWith();

  static final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  static final ButtonStyle filledButtonStyle = FilledButton.styleFrom(
    // minimumSize: Size(48, 36),
    backgroundColor: primaryColor,
    padding: EdgeInsets.symmetric(horizontal: rootFontSize),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  );

  static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}
