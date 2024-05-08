import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({
    required this.title,
    super.key,
    this.actionIcon,
    this.actionOnTap,
    this.shouldShowDrawer = false,
  });

  final String title;
  final IconData? actionIcon;
  final VoidCallback? actionOnTap;

  final bool shouldShowDrawer;

  @override
  Widget build(BuildContext context) {
    final hasAction = actionOnTap != null && actionIcon != null;
    final dimensions = AppDimensions();

    return AppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.white,
      actions: [
        if (hasAction)
          IconButton(
            onPressed: actionOnTap,
            icon: Icon(
              actionIcon,
              size: dimensions.spacing7,
              color: AppColors.blue800,
            ),
          )
      ],
      leading: shouldShowDrawer
          ? IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                AppIcons.menu,
                color: AppColors.blue800,
                size: dimensions.spacing7,
              ),
            )
          : IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                AppIcons.x,
                color: AppColors.blue800,
                size: dimensions.spacing7,
              ),
            ),
      centerTitle: true,
      title: Text(title, style: AppTypography.titleLarge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
