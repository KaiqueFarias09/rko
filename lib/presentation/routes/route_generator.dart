import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/breathing/breathing_view.dart';
import 'package:rko/presentation/views/check-if-person-breathes/check_if_person_breathes_view.dart';
import 'package:rko/presentation/views/checking-after-mouth-to-mouth/checking_after_mouth_to_mouth_view.dart';
import 'package:rko/presentation/views/cpr/cpr_view.dart';
import 'package:rko/presentation/views/first-things/first_things_view.dart';
import 'package:rko/presentation/views/heart-massage-begins/heart_massage_begins_view.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:rko/presentation/views/mouth-to-mouth-1/mouth_to_mouth_1_view.dart';
import 'package:rko/presentation/views/mouth-to-mouth-2/mouth_to_mouth_2_view.dart';
import 'package:rko/presentation/views/onboarding/onboarding_view.dart';
import 'package:rko/presentation/views/person-is-breathing-final/person_is_breathing_final_view.dart';
import 'package:rko/presentation/views/person-is-not-breathing-final/person_is_not_breathing_final_view.dart';
import 'package:rko/presentation/views/safe-position-person-is-not-breathing/safe_position_person_is_not_breathing.dart';
import 'package:rko/presentation/views/safe-position/safe_position_view.dart';
import 'package:rko/presentation/views/secure-the-area/secure_the_area_view.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SecureTheAreaView.id:
        return _buildRoute(const SecureTheAreaView());

      case HomeView.id:
        return _buildRoute(const HomeView());

      case CprView.id:
        return _buildRoute(const CprView());

      case PersonIsNotBreathingFinalView.id:
        return _buildRoute(const PersonIsNotBreathingFinalView());

      case PersonIsBreathingFinalView.id:
        return _buildRoute(const PersonIsBreathingFinalView());

      case HeartMassageBeginsView.id:
        return _buildRoute(const HeartMassageBeginsView());

      case SafePositionView.id:
        return _buildRoute(const SafePositionView());

      case SafePositionPersonIsNotBreathing.id:
        return _buildRoute(const SafePositionPersonIsNotBreathing());

      case MouthToMouth1View.id:
        return _buildRoute(const MouthToMouth1View());

      case MouthToMouth2View.id:
        return _buildRoute(const MouthToMouth2View());

      case CheckingAfterMouthToMouthView.id:
        return _buildRoute(const CheckingAfterMouthToMouthView());

      case OnboardingView.id:
        return _buildRoute(const OnboardingView());

      case FirstThingsView.id:
        return _buildRoute(const FirstThingsView());

      case CheckIfPersonBreathsView.id:
        return _buildRoute(const CheckIfPersonBreathsView());

      case BreathingView.id:
        return _buildRoute(const BreathingView());

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _buildRoute(Widget screen) {
    return PageTransition(
      child: BlocProvider.value(
        value: AudioCubit(),
        child: screen,
      ),
      type: PageTransitionType.rightToLeft,
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
