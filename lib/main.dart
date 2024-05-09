import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/image_paths.dart';
import 'package:rko/presentation/routes/route_generator.dart';
import 'package:rko/presentation/views/secure-the-area/secure_the_are_view.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_drawer.dart';
import 'package:rko/presentation/widgets/button/app_primary_button.dart';

void main() {
  runApp(const RkoApp());
}

class RkoApp extends StatelessWidget {
  const RkoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.white,
      ),
    );

    return MaterialApp(
      title: 'RKO',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

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
