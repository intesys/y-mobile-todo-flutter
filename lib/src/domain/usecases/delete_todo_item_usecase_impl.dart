import 'package:ytodos/src/domain/repositories/todo_repository.dart';

import 'delete_todo_item_usecase.dart';

class DeleteTodoItemUseCaseImpl implements DeleteTodoItemUseCase {
  final TodoRepository _todoRepository;

  const DeleteTodoItemUseCaseImpl({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<bool> execute(id) async {
    return await _todoRepository.deleteTodoItem(id);
  }
}