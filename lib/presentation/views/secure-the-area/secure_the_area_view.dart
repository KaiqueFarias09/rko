import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/image_paths.dart';
import 'package:rko/presentation/bloc/cubit/audio_cubit.dart';
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

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppbar(title: 'Bezpieczeństwo', shouldShowAction: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 34, 23, 30),
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
              onTap: () {
                audioCubit.stop();
                Navigator.of(context).pushReplacementNamed(HomeView.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
