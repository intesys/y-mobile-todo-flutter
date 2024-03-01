import 'package:ytodos/src/data/entites/todo_item_entity.dart';

abstract class TodoProvider {
  Future<List<TodoItemEntity>> getTodoItems();

  Future<String?> addTodoItem(String text);

  Future<bool> changeTodoItemStatus(TodoItemEntity todoItem);

  Future<bool> deleteTodoItem(String id);
}
