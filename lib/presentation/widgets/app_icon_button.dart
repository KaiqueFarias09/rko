import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      constraints: const BoxConstraints(
        minHeight: 100,
        minWidth: 100,
      ),
      icon: Icon(icon, color: AppColors.blue100),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.blue800,
      ),
    );
  }
}
