import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../../core_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final bool isShowBackButton;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    this.height = kToolbarHeight,
    this.title,
    this.isShowBackButton = true,
    this.automaticallyImplyLeading = true,
    this.leadingWidth,
    this.leading,
    this.actions,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return AppBar(
      centerTitle: false,
      surfaceTintColor: colors.background,
      backgroundColor: colors.background,
      leadingWidth: leadingWidth ?? 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title ?? ''),
      leading: leading ??
          (isShowBackButton
              ? AppIcons.arrowLeft(
                  padding: const EdgeInsets.all(AppDimens.iconPadding),
                  size: AppDimens.contentPaddingVertical,
                  onTap: () {
                    appLocator.get<AppNavigator>().pop();
                  },
                )
              : const SizedBox.shrink()),
      actions: actions,
    );
  }
}
