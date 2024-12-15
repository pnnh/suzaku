import 'package:suzaku/application/application.dart' as application;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  var app = await application.initApp();

  runApp(ProviderScope(child: app));
}
