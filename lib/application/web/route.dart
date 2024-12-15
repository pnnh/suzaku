
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';

final GoRouter webRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WHomePage();
      },
    ),
  ],
);
