import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';
import 'package:ytodos/src/utils/app_colors.dart';
import 'package:ytodos/src/utils/app_images.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

class TodoTileWidget extends StatelessWidget {
  final TodoItemModel todoItem;
  final void Function() onTap;

  const TodoTileWidget({
    required this.todoItem,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: todoItem.completed ? AppColors.honeydew : AppColors.seashell,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(AppImages.todoIcon),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                todoItem.text,
                style: AppTextStyles.s16w400,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: todoItem.completed ? AppColors.caribbeanGreen : AppColors.cadmiumOrange,
              ),
              child: todoItem.completed
                  ? const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 32,
                    )
                  : const SizedBox.square(dimension: 32),
            ),
          ],
        ),
      ),
    );
  }
}
