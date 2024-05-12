import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({
    required this.title,
    this.shouldShowDrawer = false,
    this.shouldShowAction = false,
    this.leadingOnTap,
    this.actionOnTap,
    super.key,
  });

  final String title;

  final bool shouldShowDrawer;
  final bool shouldShowAction;

  final VoidCallback? actionOnTap;
  final VoidCallback? leadingOnTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      actions: [
        if (shouldShowAction)
          IconButton(
            onPressed: actionOnTap,
            icon: const Icon(
              AppIcons.sound,
              size: 18,
              color: AppColors.blue800,
            ),
          )
      ],
      leading: shouldShowDrawer
          ? IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                AppIcons.menu,
                color: AppColors.blue800,
                size: 18,
              ),
            )
          : IconButton(
              onPressed: leadingOnTap ?? () => Navigator.of(context).pop(),
              icon: const Icon(
                AppIcons.chevronLeft,
                color: AppColors.blue800,
                size: 18,
              ),
            ),
      centerTitle: true,
      title: Text(title, style: AppTypography.titleMedium),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
