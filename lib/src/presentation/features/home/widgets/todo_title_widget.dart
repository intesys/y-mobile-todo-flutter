import 'package:flutter/material.dart';
import 'package:ytodos/src/utils/app_text_styles.dart';

class TodoTitleWidget extends StatelessWidget {
  final String title;
  final Widget action;

  const TodoTitleWidget({
    required this.title,
    this.action = const SizedBox(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.s20w600,
        ),
        action,
      ],
    );
  }
}
