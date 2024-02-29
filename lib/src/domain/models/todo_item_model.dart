import 'package:equatable/equatable.dart';

class TodoItemModel extends Equatable{
  final String id;
  final String text;
  final bool completed;

  const TodoItemModel({
    required this.id,
    required this.text,
    required this.completed,
  });

  @override
  List<Object?> get props => [id];
}
