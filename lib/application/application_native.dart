import 'dart:io';

import 'package:flutter/material.dart';

import 'desktop/application.dart';
import 'mobile/application.dart';

Future<Widget> initApp() async {
  if (Platform.isMacOS ||
      Platform.isLinux ||
      Platform.isWindows ||
      Platform.isFuchsia) {
    return const DesktopApplication();
  }
  if (Platform.isAndroid || Platform.isIOS) {
    return const MobileApplication();
  }

  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}
