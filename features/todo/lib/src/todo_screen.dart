import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  final AppNavigator appNavigator = appLocator.get<AppNavigator>();
  final int listLength = 7;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.appBigPagesPadding),
              shrinkWrap: true,
              itemCount: listLength,
              itemBuilder: (BuildContext context, int index) {
                return TodoTile(
                    todo: Todo(id: 'id', text: 'Todo text', isCompleted: true),
                    onTap: (String id) {});
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.appBigPagesPadding,
              vertical: AppDimens.contentPaddingVertical,
            ),
            child: Text(LocaleKeys.todo_completedList.tr(), style: AppFonts.raleway24SemiBold),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.appBigPagesPadding),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index == listLength - 1 ? 100 : 0.0),
                  child: TodoTile(
                      todo: Todo(id: 'id', text: 'Todo text', isCompleted: false),
                      onTap: (String id) {}),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
          ),
        ],
      ),
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
