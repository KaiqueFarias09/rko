import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/typography/app_typography.dart';

class BulletedText extends StatelessWidget {
  const BulletedText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\u2022 $text',
      style: AppTypography.bodyBase.copyWith(color: AppColors.gray),
      textScaler: TextScaler.linear(ScaleSize().textScaleFactor(context)),
    );
  }
}

class ScaleSize {
  double textScaleFactor(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    final width = MediaQuery.of(context).size.width;
    final double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
