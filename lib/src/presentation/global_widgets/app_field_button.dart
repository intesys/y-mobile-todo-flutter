import 'package:flutter/material.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

class AppFieldButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const AppFieldButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cadmiumOrange,
        foregroundColor: AppColors.white,
        minimumSize: const Size.fromHeight(48),
      ),
      child: Text(
        title,
        style: AppTextStyles.s20w600,
      ),
    );
  }
}
