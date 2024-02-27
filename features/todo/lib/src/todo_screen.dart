import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/empty_state.dart';
import 'widgets/todo_content.dart';

class TodoScreen extends StatelessWidget {
  final AppNavigator appNavigator = appLocator.get<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: AppDimens.appPagesPadding,
        title: LocaleKeys.todo_pageName.tr(),
        isShowBackButton: false,
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: colors.accent,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: AppDimens.appBigPagesPadding),
            padding: const EdgeInsets.all(AppDimens.iconExtraSmallPadding),
            child: AppIcons.reload(
              color: colors.buttonContent,
              onTap: () {},
              size: AppDimens.iconSizeExtraSmall,
            ),
          ),
        ],
      ),
      body: EmptyState(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: colors.accent,
          shape: BoxShape.circle,
        ),
        child: AppIcons.plus(
          size: AppDimens.iconSizeMedium,
          color: colors.buttonContent,
          padding: const EdgeInsets.all(AppDimens.iconPadding),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
