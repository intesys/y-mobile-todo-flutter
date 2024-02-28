import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

class RequirementModel {
  final IconData icon;
  final String text;

  const RequirementModel({
    this.icon = Icons.circle_rounded,
    required this.text,
  });
}

class PasswordRequirementsWidget extends StatelessWidget {
  final List<RequirementModel> requirements;

  const PasswordRequirementsWidget({
    super.key,
    required this.requirements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'password_must_contain'.tr(),
          style: AppTextStyles.s16w600,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            children: [
              for (final RequirementModel requirement in requirements)
                Row(
                  children: [
                    Icon(
                      requirement.icon,
                      size: 8,
                      color: AppColors.oldSilver,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      requirement.text,
                      style: AppTextStyles.s16w400.copyWith(color: AppColors.oldSilver),
                    ),
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
