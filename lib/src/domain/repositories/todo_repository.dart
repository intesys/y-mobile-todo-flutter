import 'package:ytodos/src/domain/models/todo_item_model.dart';

abstract class TodoRepository {
  Future<List<TodoItemModel>> getTodoList();
}