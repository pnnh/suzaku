import 'package:flutter/foundation.dart' show debugPrint, kDebugMode;

class AppConfig {
  static String get selfUrl {
    if (kDebugMode) {
      return "http://127.0.0.1:3500";
    }
    return "https://www.huable.xyz";
  }

  static String get serverUrl {
    if (kDebugMode) {
      return "https://pulsar.huable.dev/server";
    }
    return "https://pulsar.huable.xyz/server";
  }
}

class AppHelper {
  static String filesUrl(String? path) {
    debugPrint("buildFilesUrl: $path");
    if (path == null || path.isEmpty) {
      path = "/files/default/cover.jpg";
    }
    return "${AppConfig.serverUrl}$path";
  }
}
