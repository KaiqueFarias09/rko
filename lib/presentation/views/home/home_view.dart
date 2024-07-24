import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
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
      appBar: AppAppbar(
        title: S.of(context).homeViewTitle,
        shouldShowDrawer: true,
      ),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _BaseContainer(
                children: [
                  Text(
                    S.of(context).emergencyPhoneNumber,
                    style: AppTypography.titleXXLarge,
                  ),
                  Text(
                    S.of(context).emergencyPhoneLabel,
                    style: AppTypography.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  AppAlertButton(
                    text: S.of(context).callForHelpButton,
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
                    S.of(context).evaluateConditionText,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppPrimaryButton(
                    text: S.of(context).startButton,
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
                    S.of(context).rhythmForChestCompression,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppTertiaryButton(
                    text: S.of(context).startButton,
                    onTap: () => Navigator.of(context).pushNamed(CprView.id),
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
