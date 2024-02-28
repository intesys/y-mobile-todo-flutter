import 'package:ytodos/src/data/entites/todo_item_entity.dart';

abstract class TodoProvider {
  Future<List<TodoItemEntity>> getTodoItems();
}