import 'package:flutter/material.dart';
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
        children: [
          SvgPicture.asset(AppImages.mouthToMouth2),
          const BulletedText('Zaciśnij palcami nos i weź głęboki wdech. '),
          const BulletedText('Szczelnie zasłoń ustami usta poszkodowanego.'),
          const BulletedText(
            'Wdychaj powietrze przez około sekundę i patrz czy klatka piersiowa się podnosi.',
          ),
          const BulletedText('Jeśli nie, popraw pozycję głowy poszkodowanego.'),
        ],
      ),
    );
  }
}
