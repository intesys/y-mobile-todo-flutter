import 'package:get_it/get_it.dart';

final _AppDI appDI = _AppDI();
final GetIt appLocator = GetIt.instance;

const String unAuthScope = 'unauthScope';
const String authScope = 'authScope';

class _AppDI {
  void initDependencies() {}
}
