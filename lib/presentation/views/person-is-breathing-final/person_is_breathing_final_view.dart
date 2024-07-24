import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:rko/presentation/widgets/final_screen_scaffold.dart';

class PersonIsBreathingFinalView extends StatelessWidget {
  const PersonIsBreathingFinalView({super.key});

  static const id = 'person-is-breathing-final';

  @override
  Widget build(BuildContext context) {
    return FinalScreenScaffold(
      text: S.of(context).personIsBreathingFinalText,
      id: id,
    );
  }
}
