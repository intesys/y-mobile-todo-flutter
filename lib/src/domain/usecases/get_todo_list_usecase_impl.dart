import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/repositories/todo_repository.dart';

import 'get_todo_list_usecase.dart';

class GetTodoListUseCaseImpl implements GetTodoListUseCase {
  final TodoRepository _todoRepository;

  const GetTodoListUseCaseImpl({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<List<TodoItemModel>> execute() async {
    return await _todoRepository.getTodoList();
  }
}
