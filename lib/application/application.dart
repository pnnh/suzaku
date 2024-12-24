import 'package:suzaku/application/desktop/application.dart';
import 'package:suzaku/application/mobile/application.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:suzaku/application/web/application.dart';

Future<Widget> initApp() async {
  if (kIsWeb) {
    return const WebApplication();
  }

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
