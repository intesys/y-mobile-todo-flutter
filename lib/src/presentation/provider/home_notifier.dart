import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase.dart';

import 'home_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final GetTodoListUseCase _todoListUseCase;

  TaskNotifier({required GetTodoListUseCase todoListUseCase})
      : _todoListUseCase = todoListUseCase,
        super(const TaskState.initial()) {
    getTasks();
  }

  Future<void> createTask(String task) async {
    try {
      state = TaskState(tasks: [TodoItemModel(id: "id", text: "text", completed: false)]);
    } catch (e) {}
  }

  Future<void> deleteTask(String task) async {
    try {
      getTasks();
    } catch (e) {}
  }

  Future<void> updateTask(String task) async {
    try {
      getTasks();
    } catch (e) {}
  }

  void getTasks() async {
    try {
      List<TodoItemModel> tasks = await _todoListUseCase.execute();
      state = TaskState(tasks: tasks);
    } catch (e) {

    }
  }
}
