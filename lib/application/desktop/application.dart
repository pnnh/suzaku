
import 'package:flutter/material.dart';

import 'route.dart';
import 'theme.dart';

class DesktopApplication extends StatefulWidget {
  const DesktopApplication({super.key});

  @override
  State<DesktopApplication> createState() => _DesktopApplicationState();
}

class _DesktopApplicationState extends State<DesktopApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mobile App',
      routerConfig: desktopRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
        primaryColor: YTWebTheme.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(size: 24),
        textButtonTheme:
        TextButtonThemeData(style: YTWebTheme.flatButtonStyle),
        elevatedButtonTheme:
        ElevatedButtonThemeData(style: YTWebTheme.raisedButtonStyle),
        filledButtonTheme:
        FilledButtonThemeData(style: YTWebTheme.filledButtonStyle),
        outlinedButtonTheme:
        OutlinedButtonThemeData(style: YTWebTheme.outlineButtonStyle),
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(size: 24)),
      color: Colors.white,
    );
  }
}
