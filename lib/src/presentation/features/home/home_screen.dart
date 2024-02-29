import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/navigation/router.dart';
import 'package:ytodos/src/presentation/features/home/widgets/empty_todo_widget.dart';
import 'package:ytodos/src/presentation/features/home/widgets/todoTileWidget.dart';
import 'package:ytodos/src/presentation/provider/home_provider.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_paddings.dart';

import 'widgets/todo_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        shape: const CircleBorder(),
        backgroundColor: AppColors.cadmiumOrange,
        foregroundColor: AppColors.white,
        onPressed: () {
          context.goNamed(AppRouter.addTodoScreenName);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: Column(
          children: [
            TodoTitleWidget(
              title: 'todo'.tr(),
              action: Container(),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  List<TodoItemModel> completedTodoList = ref.watch(homeProvider).completedTodoList;

                  List<TodoItemModel> uncompletedTodoList =
                      ref.watch(homeProvider).uncompletedTodoList;

                  List<TodoItemModel> combinedTodoList = [
                    ...uncompletedTodoList,
                    const TodoItemModel(id: "", text: "", completed: false),
                    ...completedTodoList,
                  ];

                  if (completedTodoList.isNotEmpty || uncompletedTodoList.isNotEmpty) {
                    return ListView.separated(
                      itemCount: combinedTodoList.length,
                      itemBuilder: (context, index) {
                        if (combinedTodoList[index].id == "") {
                          return TodoTitleWidget(title: 'completed'.tr());
                        }
                        return Dismissible(
                          key: Key(combinedTodoList[index].id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            ref.read(homeProvider.notifier).deleteTask(
                                  combinedTodoList[index].id,
                                  combinedTodoList[index].completed,
                                );
                          },
                          child: TodoTileWidget(
                            todoItem: combinedTodoList[index],
                            onTap: () {
                              ref
                                  .read(homeProvider.notifier)
                                  .changeTodoItemStatus(combinedTodoList[index]);
                            },
                          ),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: 16);
                      },
                    );
                  } else {
                    return const EmptyTodoWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
