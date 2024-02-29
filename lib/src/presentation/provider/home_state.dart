import 'package:equatable/equatable.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';

class TaskState extends Equatable {
  final List<TodoItemModel> completedTodoList;
  final List<TodoItemModel> uncompletedTodoList;

  const TaskState({
    required this.completedTodoList,
    required this.uncompletedTodoList,
  });

  const TaskState.initial({
    this.completedTodoList = const [],
    this.uncompletedTodoList = const [],
  });

  TaskState copyWith({
    List<TodoItemModel>? completedTodoList,
    List<TodoItemModel>? uncompletedTodoList,
  }) {
    return TaskState(
      completedTodoList: completedTodoList ?? this.completedTodoList,
      uncompletedTodoList: uncompletedTodoList ?? this.uncompletedTodoList,
    );
  }

  @override
  List<Object> get props => [
        completedTodoList.map((task) => task.id).toList(),
        uncompletedTodoList.map((task) => task.id).toList(),
      ];
}
