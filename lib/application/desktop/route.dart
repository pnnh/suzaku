import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suzaku/application/desktop/pages/images/page.dart';
import 'package:suzaku/application/desktop/pages/notes/page.dart';
import 'package:suzaku/application/desktop/pages/uuid/page.dart';

import 'home.dart';
import 'pages/files/page.dart';
import 'pages/password/page.dart';

final GoRouter desktopRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const DToolsPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'files',
            builder: (BuildContext context, GoRouterState state) {
              return DFilesPage();
            },
          ),
          GoRoute(
            path: 'password',
            builder: (BuildContext context, GoRouterState state) {
              return DPasswordPage();
            },
          ),
          GoRoute(
            path: 'notes',
            builder: (BuildContext context, GoRouterState state) {
              return DNotesPage();
            },
          ),
          GoRoute(
            path: 'images',
            builder: (BuildContext context, GoRouterState state) {
              return DImagesPage();
            },
          ),
          GoRoute(
            path: 'uuid',
            builder: (BuildContext context, GoRouterState state) {
              return DUUIDPage();
            },
          ),
        ]),
  ],
);
