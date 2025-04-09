import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'route.dart';

Future<Widget> initApp() async {
  if (Platform.isAndroid || Platform.isIOS) {
    return const MobileApplication();
  }

  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}

class MobileApplication extends StatefulWidget {
  const MobileApplication({super.key});

  @override
  State<MobileApplication> createState() => _MobileApplicationState();
}

class _MobileApplicationState extends State<MobileApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '希波万象',
      routerConfig: mobileRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(size: 24)),
      darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(size: 24)),
      color: Colors.white,
    );
  }
}
