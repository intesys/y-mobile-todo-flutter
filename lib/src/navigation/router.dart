import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ytodos/src/presentation/features/auth/auth_screen.dart';


class AppRouter {

  static const String authRoute = '/';

  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: authRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const SizedBox();
            },
          ),
        ],
      ),
    ],
  );
}