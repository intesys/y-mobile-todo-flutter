import 'package:flutter/material.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';


class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final int? maxLines;


  const AppTextField({super.key,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {

    final InputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none
    );

    return TextField(
      maxLines: obscureText ? 1 : maxLines,
      minLines: 1,

      style: AppTextStyles.s16w400,
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
        fillColor: AppColors.seashell,

        border: inputBorder,
        filled: true,
        hintText: hintText,
        enabledBorder: inputBorder,
      ),
    );
  }
}