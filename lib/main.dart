import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/l10n/l10n.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingView.id,
      onGenerateRoute: RouteGenerator().generateRoute,
      supportedLocales: l10n,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
