import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/data/providers/todo_api_provider.dart';
import 'package:ytodos/src/data/providers/todo_api_provider_impl.dart';
import 'package:ytodos/src/data/repositories/todo_repository_impl.dart';
import 'package:ytodos/src/domain/repositories/todo_repository.dart';

final todoApiProvider = Provider<TodoProvider>((_) => TodoProviderImpl());
final todosRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(
    todoProvider: ref.read(todoApiProvider),
  ),
);
