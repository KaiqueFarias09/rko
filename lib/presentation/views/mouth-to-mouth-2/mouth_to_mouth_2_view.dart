import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/views/checking-after-mouth-to-mouth/checking_after_mouth_to_mouth_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class MouthToMouth2View extends StatelessWidget {
  const MouthToMouth2View({super.key});

  static const id = 'mouth-to-mouth-2';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: CheckingAfterMouthToMouthView.id,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.mouthToMouth2),
          BulletedText(S.of(context).mouthToMouth2Instruction1),
          BulletedText(S.of(context).mouthToMouth2Instruction2),
          BulletedText(S.of(context).mouthToMouth2Instruction3),
          BulletedText(S.of(context).mouthToMouth2Instruction4),
        ],
      ),
    );
  }
}
