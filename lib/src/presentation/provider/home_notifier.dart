import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/usecases/add_todo_item_usecase.dart';
import 'package:ytodos/src/domain/usecases/change_todo_item_status_usecase.dart';
import 'package:ytodos/src/domain/usecases/delete_todo_item_usecase.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase.dart';

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
    String? id = await _addTodoItemUseCase.execute(text);
    if (id != null) {
      state = TaskState(
        uncompletedTodoList: [
          TodoItemModel(id: id, text: text, completed: false),
          ...state.uncompletedTodoList,
        ],
        completedTodoList: state.completedTodoList,
      );
    }
  }

  Future<void> deleteTask(String id, bool isCompleted) async {
    bool isSuccess = await _deleteTodoItemUseCase.execute(id);
    if (isSuccess) {
      if (isCompleted) {
        state.completedTodoList.removeWhere((element) => element.id ==id);
      } else {
        state.uncompletedTodoList.removeWhere((element) => element.id ==id);
      }
    }
  }

  Future<void> changeTodoItemStatus(TodoItemModel todoItem) async {
    bool isSuccess = await _changeTodoItemStatusUseCase.execute(todoItem);
    if (isSuccess) {
      if (todoItem.completed) {
        state.uncompletedTodoList.remove(todoItem);
        state.completedTodoList.add(todoItem);
      } else {
        state.completedTodoList.remove(todoItem);
        state.uncompletedTodoList.add(todoItem);
      }
    }
  }

  void getTodoList() async {
    List<TodoItemModel> completedTodoList = [];
    List<TodoItemModel> uncompletedTodoList = [];
    List<TodoItemModel> todoItemList = await _todoListUseCase.execute();
    for (final TodoItemModel todo in todoItemList) {
      if (todo.completed) {
        completedTodoList.add(todo);
      } else {
        uncompletedTodoList.add(todo);
      }
    }
    print(completedTodoList);
    print(uncompletedTodoList);
    state = TaskState(
      completedTodoList: completedTodoList,
      uncompletedTodoList: uncompletedTodoList,
    );
  }
}
