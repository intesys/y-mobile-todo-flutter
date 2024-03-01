import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/repositories/todo_repository.dart';

class ChangeTodoItemStatusUseCase {
  final TodoRepository _todoRepository;

  const ChangeTodoItemStatusUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  Future<bool> execute(TodoItemModel todoItem) async {
    return _todoRepository.changeTodoItemStatus(todoItem);
  }
}
