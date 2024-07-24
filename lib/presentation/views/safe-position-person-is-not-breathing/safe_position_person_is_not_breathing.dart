import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          SvgPicture.asset(AppImages.safePosition),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletedText(S.of(context).safePositionInstructions1),
              BulletedText(S.of(context).safePositionInstructions2),
              BulletedText(S.of(context).safePositionInstructions3),
            ],
          ),
        ],
      ),
    );
  }
}
