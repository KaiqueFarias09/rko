import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/views/person-is-breathing-final/person_is_breathing_final_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class SafePositionPersonIsNotBreathing extends StatelessWidget {
  const SafePositionPersonIsNotBreathing({super.key});

  static const id = 'safe-position-person-is-not-breathing';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: PersonIsBreathingFinalView.id,
      body: Column(
        children: [
          SvgPicture.asset(AppImages.safePosition),
          const BulletedText(   
            'Jeśli poszkodowany odzyska oddech, ułóż poszkodowanego w pozycji bocznej bezpiecznej.',
          ),
          const BulletedText(
            'Połóż na boku i odchyl głowę poszkodowanego do tyłu w celu lepszego przepływu powietrza.',
          ),
          const BulletedText(
            'Monitoruj poszkodowanego,żeby zauważyć ewentualne zmiany w oddechu czy zmianie przytomności.',
          ),
        ],
      ),
    );
  }
}
