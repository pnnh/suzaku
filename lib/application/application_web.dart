import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:suzaku/application/web/application.dart';

Future<Widget> initApp() async {
  usePathUrlStrategy();
  return const WebApplication();
}
