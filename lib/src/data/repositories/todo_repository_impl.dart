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
    final List<TodoItemEntity> todoList = await _todoProvider.getTodoItems();
    return todoList.map((TodoItemEntity todo) => TodoMapper.toModel(todo)).toList();
  }

  @override
  Future<String?> addTodoItems(String text) async {
    return _todoProvider.addTodoItem(text);
  }

  @override
  Future<bool> changeTodoItemStatus(TodoItemModel todoItem) async {
    final bool isSuccess = await _todoProvider.changeTodoItemStatus(TodoMapper.toEntity(todoItem));
    return isSuccess;
  }

  @override
  Future<bool> deleteTodoItem(String id) async {
    final bool isSuccess = await _todoProvider.deleteTodoItem(id);
    return isSuccess;
  }
}
