import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/typography/app_typography.dart';

class BulletedText extends StatelessWidget {
  const BulletedText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\u2022 $text',
      style: AppTypography.bodyLarge.copyWith(color: AppColors.gray),
    );
  }
}
