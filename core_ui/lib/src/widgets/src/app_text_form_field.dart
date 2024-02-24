import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;

  const AppTextFormField({
    this.controller,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return TextFormField(
      cursorColor: colors.primaryText,
      style: AppFonts.raleway16Regular.copyWith(color: colors.primaryText),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.textInputContentPaddingHorizontal,
          vertical: AppDimens.textInputContentPaddingVertical,
        ),
        hintText: hintText,
      ),
    );
  }
}
