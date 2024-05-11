import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_bottom_navigation_bar.dart';

class AudioViewScaffold extends StatelessWidget {
  const AudioViewScaffold({
    required this.id,
    required this.body,
    this.title,
    this.bottomNavigationBar,
    this.showSecondary = true,
    this.nextScreen,
    super.key,
  }) : assert(
          bottomNavigationBar != null || nextScreen != null,
          'nextScreen cannot be empty when bottomNavigationBar is null.',
        );

  final String id;
  final Widget body;
  final bool showSecondary;
  final String? nextScreen;
  final String? title;
  final Widget? bottomNavigationBar;

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
          title: title ?? '',
          shouldShowAction: true,
          actionOnTap: () async {
            await audioCubit.stop();
          },
        ),
        bottomNavigationBar: bottomNavigationBar ??
            AppBottomNavigationBar(
              primaryOnTap: () async {
                await audioCubit.navigateWithAudioTransition(
                  context,
                  nextScreen!,
                );
              },
              showSecondary: showSecondary,
            ),
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: body,
        ),
      ),
    );
  }
}
