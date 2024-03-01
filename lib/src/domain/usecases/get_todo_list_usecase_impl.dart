import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/repositories/todo_repository.dart';

class GetTodoListUseCase {
  final TodoRepository _todoRepository;

  const GetTodoListUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  Future<List<TodoItemModel>> execute() async {
    return _todoRepository.getTodoList();
  }
}
