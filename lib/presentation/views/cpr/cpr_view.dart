import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_icon_button.dart';

class CprView extends StatefulWidget {
  const CprView({super.key});

  static const id = 'cpr';
  @override
  State<CprView> createState() => _CprViewState();
}

class _CprViewState extends State<CprView> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppbar(title: S.of(context).cprViewTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            'assets/animations/cpr.json',
            controller: _controller,
            onLoaded: (c) => _controller.duration = c.duration,
          ),
          if (!isPlaying)
            AppIconButton(
              icon: AppIcons.play,
              onPressed: () {
                setState(() => isPlaying = !isPlaying);
                audioCubit.play('${CprView.id}-animation', shouldLoop: true);
                _controller.repeat(period: _controller.duration);
              },
            )
          else
            AppIconButton(
              icon: AppIcons.stop,
              onPressed: () {
                setState(() => isPlaying = !isPlaying);
                audioCubit.stop();
                _controller.stop();
              },
            )
        ],
      ),
    );
  }
}
