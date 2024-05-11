import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rko/presentation/bloc/cubit/audio_cubit.dart';
import 'package:rko/presentation/views/check-if-person-breaths/check_if_person_breaths_view.dart';
import 'package:rko/presentation/views/first-things/first_things_view.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:rko/presentation/views/onboarding/onboarding_view.dart';
import 'package:rko/presentation/views/secure-the-area/secure_the_area_view.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SecureTheAreaView.id:
        return _buildAudioRoute(const SecureTheAreaView());

      case HomeView.id:
        return MaterialPageRoute(builder: (builder) => const HomeView());

      case OnboardingView.id:
        return MaterialPageRoute(builder: (builder) => const OnboardingView());

      case FirstThingsView.id:
        return _buildAudioRoute(const FirstThingsView());

      case CheckIfPersonBreathsView.id:
        return _buildAudioRoute(const CheckIfPersonBreathsView());

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _buildAudioRoute(Widget screen) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: AudioCubit(),
        child: screen,
      ),
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
