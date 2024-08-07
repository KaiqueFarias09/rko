import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/mouth-to-mouth-1/mouth_to_mouth_1_view.dart';
import 'package:rko/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';
import 'package:rko/presentation/widgets/button/app_secondary_button.dart';

class HeartMassageBeginsView extends StatelessWidget {
  const HeartMassageBeginsView({super.key});

  static const id = 'heart-message-begins';

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioCubit>(context);

    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        final status = state.status;
        final currentTrack = state.currentTrack;

        return AudioViewScaffold(
          id: id,
          bottomNavigationBar: AppBottomNavigationBar(
            primaryOnTap: () async {
              await audioCubit.stop();
              await Navigator.of(context).pushNamed(MouthToMouth1View.id);
              await audioCubit.play(id);
            },
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppImages.heartMassageBegins,
                height: 300,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BulletedText(S.of(context).heartMassageBeginsInstruction1),
                  BulletedText(S.of(context).heartMassageBeginsInstruction2),
                ],
              ),
              AppSecondaryButton(
                text: S.of(context).heartMassageBeginsButton,
                icon: AppIcons.heart,
                onTap: () async {
                  if (status == AudioStatus.stopped || currentTrack == id) {
                    await audioCubit.play('cpr-animation');
                    return;
                  }

                  await audioCubit.stop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
