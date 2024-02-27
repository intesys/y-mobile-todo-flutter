import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/password_rules/password_rules.dart';
import 'widgets/success_message.dart';

class AuthScreen extends StatelessWidget {
  final AppNavigator appNavigator = appLocator.get<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.appBigPagesPadding),
                  child: Column(
                    children: <Widget>[
                      Text(
                        LocaleKeys.common_appTitle.tr(),
                        style: AppFonts.raleway36Bold.copyWith(
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        LocaleKeys.auth_participationID.tr(),
                        style: AppFonts.raleway24SemiBold,
                      ),
                      Text(
                        '942863938',
                        style: AppFonts.raleway24SemiBold.copyWith(
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SuccessMessage(
                        message: LocaleKeys.auth_phoneNumberVerified.tr(),
                      ),
                      const SizedBox(height: 36),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              LocaleKeys.auth_createPassword.tr(),
                              style: AppFonts.raleway24SemiBold.copyWith(
                                color: colors.title,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: PasswordRules(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      AppTextFormField(
                        hintText: LocaleKeys.auth_enterPasswordHint.tr(),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        hintText: LocaleKeys.auth_confirmPasswordHint.tr(),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        title: LocaleKeys.auth_continueButton.tr(),
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),
                      AppRichText(
                        text: LocaleKeys.auth_changeParticipationID_text.tr(),
                        tapText: LocaleKeys.auth_changeParticipationID_tapText.tr(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.appPagesPadding),
              child: AppRichText(
                text: LocaleKeys.auth_licenceAgreement_text.tr(),
                tapText: LocaleKeys.auth_licenceAgreement_tapText.tr(),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
