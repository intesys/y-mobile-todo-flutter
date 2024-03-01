import 'package:ytodos/src/domain/repositories/todo_repository.dart';

class AddTodoItemUseCase {
  final TodoRepository _todoRepository;

  const AddTodoItemUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  Future<String?> execute(String text) async {
    return _todoRepository.addTodoItems(text);
  }
}
