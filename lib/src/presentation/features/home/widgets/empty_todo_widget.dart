import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ytodos/src/utils/app_images.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

class EmptyTodoWidget extends StatelessWidget {
  const EmptyTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          AppImages.emptyTodoIcon,
          width: 128,
          height: 128,
        ),
        const SizedBox(height: 12),
        Text(
          'no_todos'.tr(),
          style: AppTextStyles.s20w600,
        ),
      ],
    );
  }
}
