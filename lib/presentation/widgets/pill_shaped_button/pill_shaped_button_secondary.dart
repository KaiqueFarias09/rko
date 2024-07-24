import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';

class PillShapedButtonSecondary extends StatelessWidget {
  const PillShapedButtonSecondary({
    this.title,
    this.icon,
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue100,
        foregroundColor: AppColors.blue800,
        side: const BorderSide(width: 2, color: AppColors.blue800),
        padding: AppPaddings.buttonContentPadding,
      ),
      onPressed: onTap ?? () => Navigator.of(context).pop(),
      child: Row(
        children: [
          Icon(
            icon ?? AppIcons.chevronLeft,
            size: AppDimensions().spacing5,
          ),
          const SizedBox(width: 12),
          Text(
            title ?? S.of(context).pillShapedButtonSecondaryTitle,
            style: AppTypography.bodyBase,
          ),
        ],
      ),
    );
  }
}
