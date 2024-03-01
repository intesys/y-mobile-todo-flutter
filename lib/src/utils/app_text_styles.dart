import 'package:flutter/painting.dart';

sealed class AppTextStyles {
  static const String _ralewayFamily = 'Raleway';

  static const TextStyle s14w400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s16w600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s18w400 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s20w600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s24w600 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s24w700 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );

  static const TextStyle s36w700 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: _ralewayFamily,
    height: 1.5,
  );
}
