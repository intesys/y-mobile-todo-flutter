import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ytodos/src/navigation/router.dart';
import 'package:ytodos/src/presentation/global_widgets/app_field_button.dart';
import 'package:ytodos/src/presentation/global_widgets/app_text_field.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_paddings.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

import 'widgets/password_requirements_widget.dart';
import 'widgets/verified_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const String _participantId = '942863938';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: AppPaddings.mainPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 12),
                    Text(
                      'easy_trials'.tr(),
                      style: AppTextStyles.s36w700.copyWith(color: AppColors.cadmiumOrange),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Text(
                      'your_participant_id'.tr(),
                      style: AppTextStyles.s24w600,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _participantId,
                      style: AppTextStyles.s24w600.copyWith(color: AppColors.cadmiumOrange),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const VerifiedWidget(),
                    const SizedBox(height: 36),
                    Text(
                      'create_a_password'.tr(),
                      style: AppTextStyles.s24w600.copyWith(color: AppColors.cadmiumOrange),
                    ),
                    const SizedBox(height: 12),
                    PasswordRequirementsWidget(
                      requirements: <RequirementModel>[
                        RequirementModel(text: 'at_least_12_characters'.tr()),
                        RequirementModel(text: 'at_least_one_upper_and_lower_case'.tr()),
                        RequirementModel(text: 'at_least_one_special_character'.tr()),
                      ],
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      hintText: 'enter_password'.tr(),
                      obscureText: true,
                    ),
                    const SizedBox(height: 12),
                    AppTextField(
                      hintText: 'confirm_password'.tr(),
                      obscureText: true,
                    ),
                    const SizedBox(height: 12),
                    AppFieldButton(
                      onPressed: () {
                        context.goNamed(AppRouter.homeScreenName);
                      },
                      title: 'continue'.tr(),
                    ),
                    const SizedBox(height: 18),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${'use_different'.tr()} ',
                        style: AppTextStyles.s16w600.copyWith(color: AppColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'participant_id'.tr(),
                            style: AppTextStyles.s16w600.copyWith(
                              color: AppColors.cadmiumOrange,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${'by_clicking_continue'.tr()}\n',
                        style: AppTextStyles.s16w600.copyWith(color: AppColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'end_user_license_agreement'.tr(),
                            style: AppTextStyles.s16w600.copyWith(
                              color: AppColors.cadmiumOrange,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
