import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/core/constants/image_paths.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';
import 'package:rko/presentation/widgets/button/app_primary_button.dart';

class SecureTheAreaView extends StatelessWidget {
  const SecureTheAreaView({super.key});

  static const id = 'secure-the-area';

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => audioCubit.play(id));

    return PopScope(
      onPopInvoked: (didPop) async {
        if (!didPop) return;
        await audioCubit.stop();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppbar(
          title: 'Bezpieczeństwo',
          shouldShowAction: true,
          actionOnTap: audioCubit.stop,
          leadingOnTap: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppImages.secureTheArea),
              const Column(
                children: [
                  BulletedText(
                    'Upewnij się, że nie ma wokół Ciebie zagrożenia',
                  ),
                  BulletedText(
                    'Załóż sprzęt do ochrony osobistej lub odblask jeśli go posiadasz.',
                  ),
                ],
              ),
              AppPrimaryButton(
                text: 'Kontynuuj',
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
        ),
      ),
    );
  }
}
