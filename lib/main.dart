import 'package:flutter/material.dart';

import 'application/application.dart'
    if (dart.library.html) 'application/application_web.dart'
    if (dart.library.io) 'application/application_native.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var app = await initApp();

  runApp(app);
}
