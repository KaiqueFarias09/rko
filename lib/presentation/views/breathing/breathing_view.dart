import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';
import 'package:rko/presentation/views/heart-massage-begins/heart_massage_begins_view.dart';
import 'package:rko/presentation/views/safe-position/safe_position_view.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/button/app_tertiary_button.dart';

class BreathingView extends StatefulWidget {
  const BreathingView({super.key});

  static const id = 'breathing';
  @override
  State<BreathingView> createState() => _BreathingViewState();
}

class _BreathingViewState extends State<BreathingView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

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
    return AudioViewScaffold(
      id: BreathingView.id,
      title: '',
      bottomNavigationBar: const SizedBox.shrink(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Czy poszkodowany oddycha?',
            style: AppTypography.titleLarge,
          ),
          Lottie.asset('assets/animations/breathing.json',
              controller: _controller,
              onLoaded: (c) => _controller
                ..duration = c.duration
                ..repeat()),
          Column(
            children: [
              AppTertiaryButton(
                text: 'Tak',
                onTap: () => Navigator.of(context).pushNamed(
                  SafePositionView.id,
                ),
                icon: AppIcons.breathing,
              ),
              const SizedBox(height: 16),
              AppTertiaryButton(
                text: 'Nie',
                onTap: () => Navigator.of(context).pushNamed(
                  HeartMassageBeginsView.id,
                ),
                icon: AppIcons.notBreathing,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
