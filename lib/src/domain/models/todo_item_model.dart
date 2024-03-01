import 'package:equatable/equatable.dart';

class TodoItemModel extends Equatable {
  final String id;
  final String text;
  final bool completed;

  const TodoItemModel({
    required this.id,
    required this.text,
    required this.completed,
  });

  TodoItemModel copyWith({
    String? id,
    String? text,
    bool? completed,
  }) {
    return TodoItemModel(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => <Object?>[id];
}
