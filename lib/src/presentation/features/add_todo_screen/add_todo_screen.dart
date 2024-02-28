import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ytodos/src/presentation/global_widgets/app_field_button.dart';
import 'package:ytodos/src/presentation/global_widgets/app_text_field.dart';
import 'package:ytodos/src/utils/app_paddings.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AppTextField(
                hintText: 'add_your_todo'.tr(),
                maxLines: null,
              ),
            ),
            const SizedBox(height: 16),
            AppFieldButton(
              onPressed: () {},
              title: 'save'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
