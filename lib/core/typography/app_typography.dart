import 'package:flutter/material.dart';
import 'package:rko/core/colors/app_colors.dart';

abstract class AppTypography {
  static const fontFamily = 'Bahnschrift';

  static const titleXXLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 96,
    fontWeight: FontWeight.w700,
    color: AppColors.blue800,
  );

  static const titleXLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.blue800,
  );

  static const titleLarge = TextStyle(
    fontSize: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.blue800,
  );

  static const titleMedium = TextStyle(
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.blue800,
  );

  static const titleBase = TextStyle(
    fontSize: 16,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.blue800,
  );

  static const bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.blue800,
  );

  static const bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.blue800,
  );

  static const bodyBase = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    color: AppColors.blue800,
  );
}
