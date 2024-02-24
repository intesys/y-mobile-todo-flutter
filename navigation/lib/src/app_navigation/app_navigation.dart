import 'package:auth/auth.dart';
import 'package:create_todo/create_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/todo_screen.dart';

class AppNavigator {
  static const String _authPath = '/';
  static const String _todoPath = '/todo';
  static const String _createTodoPath = '/create_todo';

  GoRouter get appRouter => _router;

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: _authPath,
        builder: (BuildContext context, GoRouterState state) {
          return AuthScreen();
        },
      ),
      GoRoute(
        path: _todoPath,
        builder: (BuildContext context, GoRouterState state) {
          return TodoScreen();
        },
      ),
      GoRoute(
        path: _createTodoPath,
        builder: (BuildContext context, GoRouterState state) {
          return CreateTodoScreen();
        },
      ),
    ],
  );

  void pop() {
    _router.pop();
  }

  void pushToTodoScreen() {
    _router.push(_todoPath);
  }

  void pushToAuthScreen() {
    _router.push(_authPath);
  }

  void pushToCreateTodoScreen() {
    _router.push(_createTodoPath);
  }
}
