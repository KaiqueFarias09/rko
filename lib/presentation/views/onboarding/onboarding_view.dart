import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/presentation/views/secure-the-area/secure_the_area_view.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_drawer.dart';
import 'package:rko/presentation/widgets/button/app_primary_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const id = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: const AppDrawer(),
      appBar: const AppAppbar(title: 'RKO', shouldShowDrawer: true),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Lottie.asset('assets/animations/onboarding.json'),
              AppPrimaryButton(
                text: 'Start',
                onTap: () => Navigator.of(context).pushNamed(
                  SecureTheAreaView.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
