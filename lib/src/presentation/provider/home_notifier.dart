import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/usecases/add_todo_item_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/change_todo_item_status_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/delete_todo_item_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase_impl.dart';

import 'home_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final GetTodoListUseCase _todoListUseCase;
  final AddTodoItemUseCase _addTodoItemUseCase;
  final ChangeTodoItemStatusUseCase _changeTodoItemStatusUseCase;
  final DeleteTodoItemUseCase _deleteTodoItemUseCase;

  TaskNotifier({
    required GetTodoListUseCase getTodoListUseCase,
    required AddTodoItemUseCase addTodoItemUseCase,
    required ChangeTodoItemStatusUseCase changeTodoItemStatusUseCase,
    required DeleteTodoItemUseCase deleteTodoItemUseCase,
  })  : _todoListUseCase = getTodoListUseCase,
        _addTodoItemUseCase = addTodoItemUseCase,
        _changeTodoItemStatusUseCase = changeTodoItemStatusUseCase,
        _deleteTodoItemUseCase = deleteTodoItemUseCase,
        super(const TaskState.initial()) {
    getTodoList();
  }

  Future<void> addTodoItem(String text) async {
    final String? id = await _addTodoItemUseCase.execute(text);
    if (id != null) {
      state = TaskState(
        uncompletedTodoList: <TodoItemModel>[
          TodoItemModel(id: id, text: text, completed: false),
          ...state.uncompletedTodoList,
        ],
        completedTodoList: state.completedTodoList,
      );
    }
  }

  Future<void> deleteTask(String id, bool isCompleted) async {
    final bool isSuccess = await _deleteTodoItemUseCase.execute(id);
    if (isSuccess) {
      if (isCompleted) {
        state = state.copyWith(
          completedTodoList:
              state.completedTodoList.where((TodoItemModel element) => element.id != id).toList(),
        );
      } else {
        state = state.copyWith(
          uncompletedTodoList:
              state.uncompletedTodoList.where((TodoItemModel element) => element.id != id).toList(),
        );
      }
    }
  }

  Future<void> changeTodoItemStatus(TodoItemModel todoItem) async {
    final TodoItemModel newTodoItem = todoItem.copyWith(completed: !todoItem.completed);
    final bool isSuccess = await _changeTodoItemStatusUseCase.execute(newTodoItem);
    if (isSuccess) {
      if (newTodoItem.completed) {
        state = TaskState(
          completedTodoList: <TodoItemModel>[newTodoItem, ...state.completedTodoList],
          uncompletedTodoList: state.uncompletedTodoList
              .where((TodoItemModel element) => element.id != todoItem.id)
              .toList(),
        );
      } else {
        state = TaskState(
          completedTodoList: state.completedTodoList
              .where((TodoItemModel element) => element.id != todoItem.id)
              .toList(),
          uncompletedTodoList: <TodoItemModel>[newTodoItem, ...state.uncompletedTodoList],
        );
      }
    }
  }

  Future<void> getTodoList() async {
    state = state.copyWith(isLoading: true);
    final List<TodoItemModel> completedTodoList = <TodoItemModel>[];
    final List<TodoItemModel> uncompletedTodoList = <TodoItemModel>[];
    final List<TodoItemModel> todoItemList = await _todoListUseCase.execute();
    for (final TodoItemModel todo in todoItemList) {
      if (todo.completed) {
        completedTodoList.add(todo);
      } else {
        uncompletedTodoList.add(todo);
      }
    }
    state = TaskState(
      completedTodoList: completedTodoList,
      uncompletedTodoList: uncompletedTodoList,
    );
  }
}
