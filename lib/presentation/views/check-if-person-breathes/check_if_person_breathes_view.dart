import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/breathing/breathing_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class CheckIfPersonBreathsView extends StatelessWidget {
  const CheckIfPersonBreathsView({super.key});

  static const id = 'check-if-person-breathes';

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => audioCubit.play(id));

    return AudioViewScaffold(
      id: id,
      nextScreen: BreathingView.id,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SvgPicture.asset(AppImages.checkIfPersonBreathes),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletedText(S.of(context).checkIfPersonBreathesInstruction1),
              BulletedText(S.of(context).checkIfPersonBreathesInstruction2),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
