import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/data/data_module.dart';
import 'package:ytodos/src/domain/usecases/add_todo_item_usecase.dart';
import 'package:ytodos/src/domain/usecases/add_todo_item_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/change_todo_item_status_usecase.dart';
import 'package:ytodos/src/domain/usecases/change_todo_item_status_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/delete_todo_item_usecase.dart';
import 'package:ytodos/src/domain/usecases/delete_todo_item_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase_impl.dart';

final getTodoListUseCaseProvider = Provider<GetTodoListUseCase>(
  (ref) => GetTodoListUseCaseImpl(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);
final addTodoItemUseCaseProvider = Provider<AddTodoItemUseCase>(
  (ref) => AddTodoItemUseCaseImpl(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);
final changeTodoItemStatusUseCaseProvider = Provider<ChangeTodoItemStatusUseCase>(
  (ref) => ChangeTodoItemStatusUseCaseImpl(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);
final deleteTodoItemUseCaseProvider = Provider<DeleteTodoItemUseCase>(
  (ref) => DeleteTodoItemUseCaseImpl(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);
