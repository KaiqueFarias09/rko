import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/typography/app_typography.dart';
import 'package:rko/presentation/views/cpr/cpr_view.dart';
import 'package:rko/presentation/views/first-things/first_things_view.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_drawer.dart';
import 'package:rko/presentation/widgets/button/app_alert_button.dart';
import 'package:rko/presentation/widgets/button/app_primary_button.dart';
import 'package:rko/presentation/widgets/button/app_tertiary_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

part './components/base_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: AppColors.white,
      appBar: const AppAppbar(title: 'Zapewnij pomoc', shouldShowDrawer: true),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _BaseContainer(
                children: [
                  const Text('112', style: AppTypography.titleXXLarge),
                  const Text(
                    'Telefon alarmowy',
                    style: AppTypography.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  AppAlertButton(
                    text: 'Zadzwoń po pomoc',
                    onTap: () => launchUrlString('tel:112'),
                  )
                ],
              ),
              const SizedBox(height: 24),
              _BaseContainer(
                children: [
                  SvgPicture.asset(
                    AppImages.firstAidKit,
                    height: 150,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    'Oceń stan poszkodowanego i wykonaj instrukcje.',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppPrimaryButton(
                    text: 'Rozpocznij',
                    onTap: () => Navigator.of(context).pushNamed(
                      FirstThingsView.id,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              _BaseContainer(
                children: [
                  SvgPicture.asset(AppImages.huggingHeart, height: 150),
                  const SizedBox(height: 30),
                  Text(
                    'Rytm pomocny do masażu serca. ',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppTertiaryButton(
                    text: 'Rozpocznij',
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      CprView.id,
                      (route) => false,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
