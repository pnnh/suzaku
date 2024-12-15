import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
final GoRouter desktopRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DHomePage();
      },
    ),
  ],
);
