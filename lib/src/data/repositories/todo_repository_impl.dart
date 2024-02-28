import 'package:ytodos/src/data/entites/todo_item_entity.dart';
import 'package:ytodos/src/data/mappers/todo_mapper.dart';
import 'package:ytodos/src/data/providers/todo_api_provider.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoProvider _todoProvider;

  TodoRepositoryImpl({required TodoProvider todoProvider}) : _todoProvider = todoProvider;

  @override
  Future<List<TodoItemModel>> getTodoList() async {
    List<TodoItemEntity> todoList = await _todoProvider.getTodoItems();
    return todoList.map((todo) => TodoMapper.toEntity(todo)).toList();
  }
}
