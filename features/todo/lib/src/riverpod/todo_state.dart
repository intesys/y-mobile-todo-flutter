import 'package:core/core.dart';
import 'package:domain/domain.dart';

class TodoState extends Equatable {
  final List<Todo> uncompletedTodos;
  final List<Todo> completedTodos;
  final String? errorMessage;
  final String? successMessage;

  const TodoState({
    this.uncompletedTodos = const <Todo>[],
    this.completedTodos = const <Todo>[],
    this.errorMessage,
    this.successMessage,
  });

  TodoState copyWith({
    List<Todo>? uncompletedTodos,
    List<Todo>? completedTodos,
    String? errorMessage,
    String? successMessage,
  }) {
    return TodoState(
      uncompletedTodos: uncompletedTodos ?? this.uncompletedTodos,
      completedTodos: completedTodos ?? this.completedTodos,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        uncompletedTodos,
        completedTodos,
        errorMessage,
        successMessage,
      ];
}
