import 'package:flutter/material.dart';
import 'package:rko/presentation/widgets/final_screen_scaffold.dart';

class PersonIsNotBreathingFinalView extends StatelessWidget {
  const PersonIsNotBreathingFinalView({super.key});

  static const id = 'person-is-not-breathing-final';

  @override
  Widget build(BuildContext context) {
    return const FinalScreenScaffold(
      text:
          'Kontynuuj uciskanie serca i sztuczne oddychanie do czasu przyjazdu karetki lub gdy poszkodowany odzyska przytomność.',
      id: id,
    );
  }
}
