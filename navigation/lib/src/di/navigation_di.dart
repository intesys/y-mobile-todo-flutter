import 'package:core/core.dart';

import '../app_navigation/app_navigation.dart';

final _NavigationDI navigationDI = _NavigationDI();

class _NavigationDI {
  void setupDependencies() {
    appLocator.registerSingleton<AppNavigator>(AppNavigator());
  }
}
