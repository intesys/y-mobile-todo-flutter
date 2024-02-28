import 'package:riverpod/riverpod.dart';
import 'package:ytodos/src/data/data_module.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:ytodos/src/domain/usecases/get_todo_list_usecase_impl.dart';

final getTodoListUseCaseProvider = Provider<GetTodoListUseCase>(
  (ref) => GetTodoListUseCaseImpl(
    todoRepository: ref.read(todosRepositoryProvider),
  ),
);

