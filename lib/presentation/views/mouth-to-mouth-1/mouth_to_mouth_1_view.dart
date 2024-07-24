import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/views/mouth-to-mouth-2/mouth_to_mouth_2_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class MouthToMouth1View extends StatelessWidget {
  const MouthToMouth1View({super.key});

  static const id = 'mouth-to-mouth-1';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: MouthToMouth2View.id,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.mouthToMouth1),
          BulletedText(S.of(context).mouthToMouth1Instruction1),
          BulletedText(S.of(context).mouthToMouth1Instruction2),
        ],
      ),
    );
  }
}
