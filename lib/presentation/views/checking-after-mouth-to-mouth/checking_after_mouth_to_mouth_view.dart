import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/views/safe-position-person-is-not-breathing/safe_position_person_is_not_breathing.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class CheckingAfterMouthToMouthView extends StatelessWidget {
  const CheckingAfterMouthToMouthView({super.key});

  static const id = 'checking-after-mouth-to-mouth';

  @override
  Widget build(BuildContext context) {
    return AudioViewScaffold(
      id: id,
      nextScreen: SafePositionPersonIsNotBreathing.id,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.checkingAfterMouthToMouth),
          BulletedText(S.of(context).checkingAfterMouthToMouthInstruction1),
          BulletedText(S.of(context).checkingAfterMouthToMouthInstruction2)
        ],
      ),
    );
  }
}
