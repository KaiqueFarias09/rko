import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_bottom_navigation_bar.dart';

class AudioViewScaffold extends StatefulWidget {
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
  State<AudioViewScaffold> createState() => _AudioViewScaffoldState();
}

class _AudioViewScaffoldState extends State<AudioViewScaffold>
    with WidgetsBindingObserver {
  late final AudioCubit audioCubit;

  @override
  void initState() {
    super.initState();
    audioCubit = BlocProvider.of<AudioCubit>(context);
    audioCubit.play(widget.id);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) audioCubit.stop();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (!didPop) return;
        await audioCubit.stop();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppbar(
          title: widget.title ?? '',
          shouldShowAction: true,
          actionOnTap: () async {
            await audioCubit.stop();
          },
        ),
        bottomNavigationBar: widget.bottomNavigationBar ??
            AppBottomNavigationBar(
              primaryOnTap: () async {
                await audioCubit.navigateWithAudioTransition(
                  context,
                  widget.nextScreen!,
                );
              },
              showSecondary: widget.showSecondary,
            ),
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: widget.body,
        ),
      ),
    );
  }
}
