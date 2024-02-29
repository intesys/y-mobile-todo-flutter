import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/repositories/todo_repository.dart';

import 'change_todo_item_status_usecase.dart';

class ChangeTodoItemStatusUseCaseImpl implements ChangeTodoItemStatusUseCase {
  final TodoRepository _todoRepository;

  const ChangeTodoItemStatusUseCaseImpl({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<bool> execute(TodoItemModel todoItem) async {
    return await _todoRepository.changeTodoItemStatus(todoItem);
  }
}