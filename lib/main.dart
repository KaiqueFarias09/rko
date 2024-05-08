import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    return MaterialApp(
      title: 'RKO',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppAppbar(
        title: 'RKO',
        shouldShowDrawer: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 34, 23, 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              SvgPicture.asset('assets/images/initial.svg'),
              AppPrimaryButton(text: 'Start', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
