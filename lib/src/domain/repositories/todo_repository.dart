import 'package:ytodos/src/domain/models/todo_item_model.dart';

abstract class TodoRepository {
  Future<List<TodoItemModel>> getTodoList();
  Future<String?> addTodoItems(String text);
  Future<bool> changeTodoItemStatus(TodoItemModel todoItem);
  Future<bool> deleteTodoItem(String id);
}