import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/typography/app_typography.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required this.text,
    required this.onTap,
    super.key,
    this.icon,
  });

  final String text;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final iconWidget = icon != null ? Icon(icon) : const SizedBox();
    final dimensions = AppDimensions();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            dimensions.borderRadius1,
          )),
        ),
        foregroundColor: AppColors.blue100,
        padding: EdgeInsets.symmetric(vertical: dimensions.spacing6),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment:
            icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          iconWidget,
          Text(
            text,
            style: AppTypography.bodyLarge.copyWith(color: AppColors.blue100),
          ),
        ],
      ),
    );
  }
}
