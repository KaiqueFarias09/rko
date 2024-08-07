import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/presentation/views/check-if-person-breathes/check_if_person_breathes_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';
import 'package:rko/presentation/widgets/button/app_secondary_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FirstThingsView extends StatelessWidget {
  const FirstThingsView({super.key});

  static const id = 'first-things';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: CheckIfPersonBreathsView.id,
      showSecondary: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.shakeThePerson),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletedText(S.of(context).firstThingsInstruction1),
              BulletedText(S.of(context).firstThingsInstruction2),
            ],
          ),
          AppSecondaryButton(
            text: S.of(context).firstThingsButton,
            icon: AppIcons.call,
            onTap: () => launchUrlString('tel:112'),
          ),
        ],
      ),
    );
  }
}
