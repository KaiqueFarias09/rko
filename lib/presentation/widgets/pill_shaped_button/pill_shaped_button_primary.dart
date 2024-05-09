import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';

class PillShapedButtonPrimary extends StatelessWidget {
  const PillShapedButtonPrimary({
    required this.onTap,
    this.title,
    this.icon,
    super.key,
  });

  final String? title;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue800,
          foregroundColor: AppColors.blue100,
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 32,
          )),
      onPressed: onTap,
      child: Row(
        children: [
          Text(
            title ?? 'Dalej',
            style: AppTypography.bodyBase.copyWith(
              color: AppColors.blue100,
            ),
          ),
          const SizedBox(width: 12),
          Icon(icon ?? AppIcons.heart)
        ],
      ),
    );
  }
}