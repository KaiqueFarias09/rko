import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/presentation/routes/route_generator.dart';
import 'package:rko/presentation/views/onboarding/onboarding_view.dart';

void main() {
  runApp(const RkoApp());
}

class RkoApp extends StatelessWidget {
  const RkoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.white,
      ),
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'RKO',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const OnboardingView(),
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
