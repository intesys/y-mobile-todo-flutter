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
                        'EastTrials',
                        style: AppFonts.raleway36Bold.copyWith(
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        'Your Participation ID',
                        style: AppFonts.raleway24SemiBold,
                      ),
                      Text(
                        '942863938',
                        style: AppFonts.raleway24SemiBold.copyWith(
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SuccessMessage(message: 'Your phone number is verified!'),
                      const SizedBox(height: 36),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Create a password',
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
                      const AppTextFormField(
                        hintText: 'Enter password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      const AppTextFormField(
                        hintText: 'Confirm password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        title: 'Continue',
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),
                      AppRichText(
                        text: 'Use different',
                        tapText: 'Participation ID',
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
                text: 'By clicking continue, you agree to the',
                tapText: '\nEnd user licence agreement',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
