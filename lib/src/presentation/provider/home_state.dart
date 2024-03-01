import 'package:ytodos/src/domain/models/todo_item_model.dart';

class TaskState {
  final List<TodoItemModel> completedTodoList;
  final List<TodoItemModel> uncompletedTodoList;
  final bool isLoading;

  const TaskState({
    required this.completedTodoList,
    required this.uncompletedTodoList,
    this.isLoading = false,
  });

  const TaskState.initial({
    this.completedTodoList = const <TodoItemModel>[],
    this.uncompletedTodoList = const <TodoItemModel>[],
    this.isLoading = false,
  });

  TaskState copyWith({
    List<TodoItemModel>? completedTodoList,
    List<TodoItemModel>? uncompletedTodoList,
    bool? isLoading,
  }) {
    return TaskState(
      completedTodoList: completedTodoList ?? this.completedTodoList,
      uncompletedTodoList: uncompletedTodoList ?? this.uncompletedTodoList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
