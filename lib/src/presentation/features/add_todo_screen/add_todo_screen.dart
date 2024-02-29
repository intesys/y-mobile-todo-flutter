import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ytodos/src/navigation/router.dart';
import 'package:ytodos/src/presentation/global_widgets/app_field_button.dart';
import 'package:ytodos/src/presentation/global_widgets/app_text_field.dart';
import 'package:ytodos/src/presentation/provider/home_provider.dart';
import 'package:ytodos/src/utils/app_paddings.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
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
                  controller: _controller,
                  hintText: 'add_your_todo'.tr(),
                  maxLines: null,
                ),
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (context, ref, _) {
                  return AppFieldButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        ref.watch(homeProvider.notifier).addTodoItem(_controller.text);
                        context.goNamed(AppRouter.homeScreenName);
                      }
                    },
                    title: 'save'.tr(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
