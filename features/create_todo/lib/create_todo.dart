library create_todo;

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class CreateTodoScreen extends StatelessWidget {
  final AppNavigator appNavigator = appLocator.get<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: const Center(),
    );
  }
}
