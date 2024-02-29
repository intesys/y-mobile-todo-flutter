import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'todo_state.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final GetTodoListUseCase _getTodoListUseCase;
  final ChangeTodoStatusUseCase _changeTodoStatusUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoNotifier({
    required GetTodoListUseCase getTodoListUseCase,
    required ChangeTodoStatusUseCase changeTodoStatusUseCase,
    required DeleteTodoUseCase deleteTodoUseCase,
  })  : _getTodoListUseCase = getTodoListUseCase,
        _changeTodoStatusUseCase = changeTodoStatusUseCase,
        _deleteTodoUseCase = deleteTodoUseCase,
        super(const TodoState()) {
    getTodoLists();
  }

  Future<void> getTodoLists() async {
    try {
      final List<Todo> commonList = await _getTodoListUseCase.execute();

      state = TodoState(
        completedTodos: commonList.where((Todo item) => item.isCompleted).toList(),
        uncompletedTodos: commonList.where((Todo item) => !item.isCompleted).toList(),
      );
    } catch (error) {
      state = TodoState(
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> changeTodoStatus({
    required String id,
    required bool status,
  }) async {
    try {
      final ActionResult result = await _changeTodoStatusUseCase.execute(
        ChangeTodoStatusPayload(todoId: id, status: status),
      );

      if (result.success) {
        final List<Todo> newCompletedList;
        final List<Todo> newUncompletedList;
        if (status) {
          newCompletedList = <Todo>[...state.completedTodos];
          final Todo todo = state.uncompletedTodos.firstWhere((Todo item) => item.id == id);
          newCompletedList.add(
            Todo(id: todo.id, text: todo.text, isCompleted: !todo.isCompleted),
          );

          newUncompletedList = <Todo>[...state.uncompletedTodos]
            ..removeWhere((Todo item) => item.id == id);
        } else {
          newCompletedList = <Todo>[...state.completedTodos]
            ..removeWhere((Todo item) => item.id == id);

          newUncompletedList = <Todo>[...state.uncompletedTodos];
          final Todo todo = state.completedTodos.firstWhere((Todo item) => item.id == id);
          newUncompletedList.add(
            Todo(id: todo.id, text: todo.text, isCompleted: !todo.isCompleted),
          );
        }

        state = TodoState(
          completedTodos: newCompletedList,
          uncompletedTodos: newUncompletedList,
          successMessage: result.message,
        );
      } else {
        state = TodoState(
          errorMessage: result.message,
        );
      }
    } catch (error) {
      state = TodoState(
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      final ActionResult actionResult = await _deleteTodoUseCase.execute(id);

      if (actionResult.success) {
        final List<Todo> newCompletedList = <Todo>[...state.completedTodos]
          ..removeWhere((Todo item) => item.id == id);
        final List<Todo> newUncompletedList = <Todo>[...state.uncompletedTodos]
          ..removeWhere((Todo item) => item.id == id);

        state = TodoState(
          completedTodos: newCompletedList,
          uncompletedTodos: newUncompletedList,
          successMessage: actionResult.message,
        );
      } else {
        state = TodoState(
          errorMessage: actionResult.message,
        );
      }
    } catch (error) {
      state = TodoState(
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> openCreateTodoScreen() async {
    await AppNavigator.pushToCreateTodoScreen();
    await getTodoLists();
  }
}
