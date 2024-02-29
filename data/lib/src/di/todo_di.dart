import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../api/api_privider.dart';
import '../providers/todo_provider.dart';
import '../repository/todo_repository_impl.dart';

void initTodoDependencies() {
  appLocator.registerLazySingleton<TodoProvider>(
    () => TodoProvider(
      apiProvider: appLocator<ApiProvider>(),
    ),
  );

  appLocator.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      todoProvider: appLocator<TodoProvider>(),
    ),
  );

  appLocator.registerLazySingleton<GetTodoListUseCase>(
    () => GetTodoListUseCase(
      todoRepository: appLocator<TodoRepository>(),
    ),
  );

  appLocator.registerLazySingleton<CreateTodoUseCase>(
    () => CreateTodoUseCase(
      todoRepository: appLocator<TodoRepository>(),
    ),
  );

  appLocator.registerLazySingleton<ChangeTodoStatusUseCase>(
    () => ChangeTodoStatusUseCase(
      todoRepository: appLocator<TodoRepository>(),
    ),
  );

  appLocator.registerLazySingleton<DeleteTodoUseCase>(
    () => DeleteTodoUseCase(
      todoRepository: appLocator<TodoRepository>(),
    ),
  );
}
