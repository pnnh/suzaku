import 'dart:io';

import 'package:flutter/material.dart';

import 'desktop/application.dart';
import 'mobile/application.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

Future<Widget> initApp() async {
  doWhenWindowReady(() {
    const initialSize = Size(1024, 768);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });

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
