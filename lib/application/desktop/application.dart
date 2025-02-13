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
      title: '希波万象',
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
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: NoTransitionsBuilder(),
            TargetPlatform.iOS: NoTransitionsBuilder(),
            TargetPlatform.macOS: NoTransitionsBuilder(),
            TargetPlatform.windows: NoTransitionsBuilder(),
            TargetPlatform.linux: NoTransitionsBuilder(),
          })),
      darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(size: 24)),
      color: Colors.white,
    );
  }
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return child!;
  }
}
