library todo;

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class TodoScreen extends StatelessWidget {
  final AppNavigator appNavigator = appLocator.get<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: const Center(),
    );
  }
}
