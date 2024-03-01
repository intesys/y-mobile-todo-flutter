import 'package:ytodos/src/domain/repositories/todo_repository.dart';

class DeleteTodoItemUseCase {
  final TodoRepository _todoRepository;

  const DeleteTodoItemUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  Future<bool> execute(String id) async {
    return _todoRepository.deleteTodoItem(id);
  }
}
