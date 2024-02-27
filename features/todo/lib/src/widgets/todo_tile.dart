import 'package:core_ui/core_ui.dart';
import 'package:domain/models/src/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final Function(String id) onTap;

  const TodoTile({
    required this.todo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return GestureDetector(
      onTap: onTap(todo.id),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.contentBigPaddingVertical,
          horizontal: AppDimens.contentBigPaddingVertical,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.appBorderSmallRadius),
          color: todo.isCompleted ? colors.successBackground : colors.listTileBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppIcons.todoIcon(size: AppDimens.iconSizeMedium),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                todo.text,
                style: AppFonts.raleway14Regular,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: todo.isCompleted ? colors.successContent : colors.accent,
              ),
              padding: const EdgeInsets.all(AppDimens.iconExtraSmallPadding),
              child: todo.isCompleted
                  ? AppIcons.check(
                      size: AppDimens.iconSizeExtraSmall,
                      color: colors.buttonContent,
                    )
                  : const SizedBox(
                      width: AppDimens.iconSizeExtraSmall,
                      height: AppDimens.iconSizeExtraSmall,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
