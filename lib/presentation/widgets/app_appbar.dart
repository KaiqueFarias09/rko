import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({
    required this.title,
    this.shouldShowDrawer = false,
    this.shouldShowAction = false,
    super.key,
  });

  final String title;

  final bool shouldShowDrawer;
  final bool shouldShowAction;

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions();

    return AppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      actions: [
        if (shouldShowAction)
          IconButton(
            onPressed: () {},
            icon: Icon(
              AppIcons.sound,
              size: dimensions.spacing6,
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
                size: dimensions.spacing6,
              ),
            ),
      centerTitle: true,
      title: Text(title, style: AppTypography.titleLarge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
