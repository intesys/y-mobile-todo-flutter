import 'package:core/core.dart';

class CreateTodoState extends Equatable {
  final String? errorMessage;
  final String? successMessage;

  const CreateTodoState({
    this.errorMessage,
    this.successMessage,
  });

  @override
  List<Object?> get props => <Object?>[
        errorMessage,
        successMessage,
      ];
}
