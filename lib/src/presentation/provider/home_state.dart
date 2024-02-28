import 'package:equatable/equatable.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';

class TaskState extends Equatable {
  final List<TodoItemModel> tasks;

  const TaskState({
    required this.tasks,
  });
  const TaskState.initial({
    this.tasks = const [],
  });

  TaskState copyWith({
    List<TodoItemModel>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [tasks.map((task) => task.id).toList()];
}