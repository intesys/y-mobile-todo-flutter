import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/domain/domain_module.dart';

import 'home_notifier.dart';
import 'home_state.dart';

final homeProvider = StateNotifierProvider<TaskNotifier, TaskState>(
      (ref) => TaskNotifier(
    todoListUseCase:  ref.read(getTodoListUseCaseProvider),
  ),
);