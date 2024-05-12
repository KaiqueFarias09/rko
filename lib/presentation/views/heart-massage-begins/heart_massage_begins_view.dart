import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/presentation/views/cpr/cpr_view.dart';
import 'package:rko/presentation/views/mouth-to-mouth-1/mouth_to_mouth_1_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';
import 'package:rko/presentation/widgets/button/app_secondary_button.dart';

class HeartMassageBeginsView extends StatelessWidget {
  const HeartMassageBeginsView({super.key});

  static const id = 'heart-message-begins';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: MouthToMouth1View.id,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppImages.heartMassageBegins,
            height: 300,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletedText('Rozpocznij ucisk klatki piersiowej.'),
              BulletedText(
                'Ułóż swoją dłoń na klatce piersiowej i spleć palce z drugą. Na wyprostowanych ramionach uciskaj klatkę do głębokości 5 cm. Nie odrywając dłoni zwolnij ucisk. Uciskaj 100 - 120 razy na minutę.',
              ),
            ],
          ),
          AppSecondaryButton(
            text: 'Tempo uciskania',
            icon: AppIcons.heart,
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              CprView.id,
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}
