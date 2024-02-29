import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'create_todo_state.dart';

class CreateTodoNotifier extends StateNotifier<CreateTodoState> {
  final CreateTodoUseCase _createTodoUseCase;

  CreateTodoNotifier({
    required CreateTodoUseCase createTodoUseCase,
  })  : _createTodoUseCase = createTodoUseCase,
        super(const CreateTodoState());

  Future<void> createTodo(String text) async {
    try {
      final ActionResult result = await _createTodoUseCase.execute(text);

      if (result.success) {
        state = CreateTodoState(
          successMessage: result.message,
        );
        AppNavigator.pop();
      } else {
        state = CreateTodoState(
          errorMessage: result.message,
        );
      }
    } catch (error) {
      state = CreateTodoState(
        errorMessage: error.toString(),
      );
    }
  }
}
