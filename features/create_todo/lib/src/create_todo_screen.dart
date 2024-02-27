import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';

class CreateTodoScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final AppNavigator appNavigator = appLocator.get<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppDimens.appBigPagesPadding,
          right: AppDimens.appBigPagesPadding,
          bottom: AppDimens.appBigPagesPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppTextFormField(
              maxLines: 3,
              controller: controller,
              hintText: LocaleKeys.createTodo_hintText.tr(),
              inputFormatters: <TextInputFormatter>[
                // CustomTextFieldFormatter(),
                LengthLimitingTextInputFormatter(100),
              ],
            ),
            AppButton(
              title: LocaleKeys.createTodo_button.tr(),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
