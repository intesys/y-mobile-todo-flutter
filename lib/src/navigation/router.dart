import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ytodos/src/presentation/features/add_todo_screen/add_todo_screen.dart';
import 'package:ytodos/src/presentation/features/auth/auth_screen.dart';
import 'package:ytodos/src/presentation/features/home/home_screen.dart';

class AppRouter {
  static const String _authRoute = '/';
  static const String _homeRoute = 'home';
  static const String _addTodoRoute = 'add_todo';

  static const String homeScreenName = 'home';
  static const String addTodoScreenName = 'add_todo';

  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: _authRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: _homeRoute,
            name: homeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                path: _addTodoRoute,
                name: addTodoScreenName,
                builder: (BuildContext context, GoRouterState state) {
                  return const AddTodoScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
