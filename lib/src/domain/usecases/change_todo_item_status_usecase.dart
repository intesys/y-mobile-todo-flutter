import 'package:ytodos/src/domain/models/todo_item_model.dart';

abstract class ChangeTodoItemStatusUseCase {
  Future<bool> execute(TodoItemModel todoItem);
}
