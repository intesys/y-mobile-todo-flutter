part of core_ui;

class AppIcons {
  static const String packageName = kPackageName;

  static const String _basePath = kIconsPath;

  static const String _todoIconKey = '${_basePath}todo_icon.svg';
  static const String _doneKey = '${_basePath}done.svg';
  static const String _dotKey = '${_basePath}dot.svg';

  static const AppIcon todoIcon = AppIcon(_todoIconKey);
  static const AppIcon done = AppIcon(_doneKey);
  static const AppIcon dot = AppIcon(_dotKey);
}
