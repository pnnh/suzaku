import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suzaku/application/web/pages/password/page.dart';
import 'package:suzaku/application/web/pages/svg/page.dart';
import 'package:suzaku/application/web/pages/uuid/page.dart';

import 'home.dart';

final GoRouter webRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return WHomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'password',
            builder: (BuildContext context, GoRouterState state) {
              return WPasswordPage();
            },
          ),
          GoRoute(
            path: 'uuid',
            builder: (BuildContext context, GoRouterState state) {
              return WUUIDPage();
            },
          ),
          GoRoute(
            path: 'svg',
            builder: (BuildContext context, GoRouterState state) {
              return WSvgPage();
            },
          ),
        ]),
  ],
);
