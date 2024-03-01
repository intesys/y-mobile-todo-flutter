import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/data/data_module.dart';
import 'package:ytodos/src/domain/usecases/add_todo_item_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/change_todo_item_status_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/delete_todo_item_usecase_impl.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase_impl.dart';

final Provider<GetTodoListUseCase> getTodoListUseCaseProvider = Provider<GetTodoListUseCase>(
  (ProviderRef<GetTodoListUseCase> ref) => GetTodoListUseCase(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);

final Provider<AddTodoItemUseCase> addTodoItemUseCaseProvider = Provider<AddTodoItemUseCase>(
  (ProviderRef<AddTodoItemUseCase> ref) => AddTodoItemUseCase(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);

final Provider<ChangeTodoItemStatusUseCase> changeTodoItemStatusUseCaseProvider =
    Provider<ChangeTodoItemStatusUseCase>(
  (ProviderRef<ChangeTodoItemStatusUseCase> ref) => ChangeTodoItemStatusUseCase(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);

final Provider<DeleteTodoItemUseCase> deleteTodoItemUseCaseProvider =
    Provider<DeleteTodoItemUseCase>(
  (ProviderRef<DeleteTodoItemUseCase> ref) => DeleteTodoItemUseCase(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);
