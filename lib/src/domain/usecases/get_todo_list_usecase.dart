import 'package:ytodos/src/domain/models/todo_item_model.dart';

abstract class GetTodoListUseCase {
  Future<List<TodoItemModel>> execute();
}
