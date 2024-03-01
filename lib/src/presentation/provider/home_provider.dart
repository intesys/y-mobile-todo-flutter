import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/domain/domain_module.dart';

import 'home_notifier.dart';
import 'home_state.dart';

final StateNotifierProvider<TaskNotifier, TaskState> homeProvider =
    StateNotifierProvider<TaskNotifier, TaskState>(
  (StateNotifierProviderRef<TaskNotifier, TaskState> ref) => TaskNotifier(
    getTodoListUseCase: ref.read(getTodoListUseCaseProvider),
    addTodoItemUseCase: ref.read(addTodoItemUseCaseProvider),
    changeTodoItemStatusUseCase: ref.read(changeTodoItemStatusUseCaseProvider),
    deleteTodoItemUseCase: ref.read(deleteTodoItemUseCaseProvider),
  ),
);
