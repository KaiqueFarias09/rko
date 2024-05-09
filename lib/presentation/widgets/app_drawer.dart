import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/image_paths.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blue500,
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(AppIcons.x, color: AppColors.blue100),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Column(
                children: [
                  CustomListTile(
                    icon: AppIcons.breathing,
                    text: 'Menu główne',
                    onTap: () {},
                  ),
                  CustomListTile(
                    icon: AppIcons.heart,
                    text: 'Tempo uciskania',
                    onTap: () {},
                  ),
                  CustomListTile(
                    icon: AppIcons.breathing,
                    text: 'Numer alarmowy',
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  SvgPicture.asset(AppImages.huggingHeartTinted),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 32, color: AppColors.blue100),
      title: Text(
        text,
        style: AppTypography.titleLarge.copyWith(color: AppColors.blue100),
      ),
    );
  }
}
