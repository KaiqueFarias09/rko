import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_padding.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/widgets/app_appbar.dart';
import 'package:rko/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:rko/presentation/widgets/app_drawer.dart';

class AudioViewScaffold extends StatefulWidget {
  const AudioViewScaffold({
    required this.id,
    required this.body,
    this.title,
    this.bottomNavigationBar,
    this.showSecondary = true,
    this.showDrawer = true,
    this.nextScreen,
    super.key,
  }) : assert(
          bottomNavigationBar != null || nextScreen != null,
          'nextScreen cannot be null when bottomNavigationBar is null.',
        );

  final String id;
  final Widget body;
  final bool showSecondary;
  final bool showDrawer;
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
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        final isMuted = state.status == AudioStatus.muted;

        return PopScope(
          onPopInvoked: (didPop) async {
            if (!didPop) return;
            await audioCubit.stop();
          },
          child: Scaffold(
            drawer: widget.showDrawer ? const AppDrawer() : null,
            backgroundColor: AppColors.white,
            appBar: AppAppbar(
              title: widget.title ?? '',
              shouldShowAction: true,
              shouldShowDrawer: widget.showDrawer,
              actionIconButton: isMuted == true
                  ? IconButton(
                      onPressed: () => audioCubit.play(widget.id),
                      icon: const Icon(
                        AppIcons.muted,
                        size: 20,
                      ),
                      color: AppColors.blue800,
                    )
                  : IconButton(
                      onPressed: () => audioCubit.stop(),
                      icon: const Icon(
                        AppIcons.sound,
                        size: 20,
                      ),
                      color: AppColors.blue800,
                    ),
            ),
            bottomNavigationBar: widget.bottomNavigationBar ??
                AppBottomNavigationBar(
                  primaryOnTap: () async {
                    await audioCubit.stop();
                    await Navigator.of(context).pushNamed(widget.nextScreen!);
                    await audioCubit.play(widget.id);
                  },
                  showSecondary: widget.showSecondary,
                ),
            body: Padding(
              padding: AppPaddings.defaultPadding,
              child: widget.body,
            ),
          ),
        );
      },
    );
  }
}
