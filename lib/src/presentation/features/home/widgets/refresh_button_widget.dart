import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ytodos/src/presentation/provider/home_provider.dart';
import 'package:ytodos/src/utils/app_colors.dart';

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        return GestureDetector(
          onTap: () {
            ref.read(homeProvider.notifier).getTodoList();
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cadmiumOrange,
            ),
            child: const Icon(
              Icons.refresh_rounded,
              color: AppColors.white,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}
