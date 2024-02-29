import 'package:core/core.dart';

import '../api/api_privider.dart';
import '../api/helpers/error_handler.dart';
import 'todo_di.dart';

final _DataDI dataDI = _DataDI();

class _DataDI {
  Future<void> initDependencies() async {
    _initApi();
    initTodoDependencies();
  }

  void _initApi() {
    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(errorHandler: ErrorHandler()),
    );
  }
}
