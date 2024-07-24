import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';
import 'package:rko/presentation/widgets/button/app_primary_button.dart';

class SecureTheAreaView extends StatelessWidget {
  const SecureTheAreaView({super.key});

  static const id = 'secure-the-area';

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => audioCubit.play(id));

    return AudioViewScaffold(
      title: S.of(context).secureTheAreaTitle,
      id: id,
      bottomNavigationBar: const SizedBox.shrink(),
      showDrawer: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.secureTheArea),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletedText(S.of(context).ensureNoThreats),
              BulletedText(S.of(context).wearProtection),
            ],
          ),
          AppPrimaryButton(
            text: S.of(context).continueButton,
            onTap: () async {
              await audioCubit.stop();
              await Navigator.of(context).pushNamedAndRemoveUntil(
                HomeView.id,
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
