import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      title: 'Bezpieczeństwo',
      id: id,
      bottomNavigationBar: const SizedBox.shrink(),
      body: Scaffold(
        body: Column(
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
    );
  }
}
