import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.honeydew,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.check_circle_outline_outlined,
            color: AppColors.caribbeanGreen,
            size: 32,
          ),
          const SizedBox(width: 8),
          Text(
            'your_phone_number_is_verified'.tr(),
            style: AppTextStyles.s16w600.copyWith(color: AppColors.caribbeanGreen),
          ),
        ],
      ),
    );
  }
}
