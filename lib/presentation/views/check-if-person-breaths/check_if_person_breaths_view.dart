import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rko/core/constants/image_paths.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
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
      nextScreen: '',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SvgPicture.asset(AppImages.checkIfPersonBreathes),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletedText('Sprawdź czy poszkodowany oddycha.'),
              SizedBox(height: 16),
              BulletedText(
                'Obserwuj ruch klatki piersiowej, czy słyszysz oddech oraz czy czujesz go na swoim policzku.',
              ),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
