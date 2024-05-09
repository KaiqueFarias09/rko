import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/image_paths.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/typography/app_typography.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_drawer.dart';
import 'package:rko/presentation/widgets/button/app_alert_button.dart';
import 'package:rko/presentation/widgets/button/app_primary_button.dart';
import 'package:rko/presentation/widgets/button/app_tertiary_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const id = 'home';

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions();

    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: AppColors.white,
      appBar: const AppAppbar(title: 'Zapewnij pomoc', shouldShowDrawer: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 34, 23, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue800),
                  borderRadius: BorderRadius.circular(dimensions.borderRadius1),
                ),
                child: Column(
                  children: [
                    const Text('112', style: AppTypography.titleXXLarge),
                    const Text(
                      'Telefon alarmowy',
                      style: AppTypography.titleLarge,
                    ),
                    const SizedBox(height: 30),
                    AppAlertButton(
                      text: 'Zadzwoń po pomoc',
                      onTap: () => launchUrlString('tel:112'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue800),
                  borderRadius: BorderRadius.circular(dimensions.borderRadius1),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.firstAidKit),
                    const SizedBox(height: 40),
                    Text(
                      'Oceń stan poszkodowanego i wykonaj instrukcje.',
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AppPrimaryButton(text: 'Rozpocznij', onTap: () {})
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue800),
                  borderRadius: BorderRadius.circular(dimensions.borderRadius1),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.huggingHeart),
                    const SizedBox(height: 40),
                    Text(
                      'Rytm pomocny do masażu serca. ',
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AppTertiaryButton(text: 'Rozpocznij', onTap: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
