import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/views/person-is-breathing-final/person_is_breathing_final_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class SafePositionView extends StatelessWidget {
  const SafePositionView({super.key});

  static const id = 'safe-position';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: PersonIsBreathingFinalView.id,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.safePosition),
          BulletedText(S.of(context).safePositionInstructions1),
          BulletedText(S.of(context).safePositionInstructions2),
          BulletedText(S.of(context).safePositionInstructions3),
        ],
      ),
    );
  }
}
