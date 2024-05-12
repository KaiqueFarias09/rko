import 'package:flutter/material.dart';
import 'package:rko/presentation/widgets/final_screen_scaffold.dart';

class PersonIsBreathingFinalView extends StatelessWidget {
  const PersonIsBreathingFinalView({super.key});

  static const id = 'person-is-breathing-final';

  @override
  Widget build(BuildContext context) {
    return const FinalScreenScaffold(
      text:
          'Zaczekaj do przyjazdu karetki lub do odzyskania przytomności przez poszkodowanego.',
      id: id,
    );
  }
}
