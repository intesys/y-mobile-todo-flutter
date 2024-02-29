import 'package:ytodos/src/domain/repositories/todo_repository.dart';

import 'add_todo_item_usecase.dart';

class AddTodoItemUseCaseImpl implements AddTodoItemUseCase {
  final TodoRepository _todoRepository;

  const AddTodoItemUseCaseImpl({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<String?> execute(String text) async {
    return await _todoRepository.addTodoItems(text);
  }
}