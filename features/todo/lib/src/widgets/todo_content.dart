import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';

import 'todo_tile.dart';

class TodoContent extends StatelessWidget {
  final int listLength = 7;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                padding: EdgeInsets.only(
                  bottom: index == listLength - 1 ? AppDimens.floatingButtonAppPadding : 0.0,
                ),
                child: TodoTile(
                    todo: Todo(id: 'id', text: 'Todo text', isCompleted: false),
                    onTap: (String id) {}),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          ),
        ),
      ],
    );
  }
}
