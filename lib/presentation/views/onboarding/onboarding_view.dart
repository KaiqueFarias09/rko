import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/image_paths.dart';
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
      drawer: const AppDrawer(),
      appBar: const AppAppbar(title: 'RKO', shouldShowDrawer: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 34, 23, 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              SvgPicture.asset(AppImages.initial),
              AppPrimaryButton(
                text: 'Start',
                onTap: () => Navigator.of(context).pushReplacementNamed(
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
