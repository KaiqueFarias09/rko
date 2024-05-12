import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:rko/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:rko/presentation/widgets/audio_view_scaffold.dart';
import 'package:rko/presentation/widgets/bulleted_text.dart';

class FinalScreenScaffold extends StatefulWidget {
  const FinalScreenScaffold({required this.text, required this.id, super.key});

  final String text;

  final String id;
  @override
  State<FinalScreenScaffold> createState() => _FinalScreenScaffoldState();
}

class _FinalScreenScaffoldState extends State<FinalScreenScaffold>
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
    final audioCubit = BlocProvider.of<AudioCubit>(context);

    return AudioViewScaffold(
      title: '',
      bottomNavigationBar: AppBottomNavigationBar(
          primaryIcon: AppIcons.goBack,
          primaryTitle: 'Menu',
          primaryOnTap: () async {
            await audioCubit.stop();
            await Navigator.of(context).pushNamedAndRemoveUntil(
              HomeView.id,
              (route) => false,
            );
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset('assets/animations/ambulance.json',
              controller: _controller,
              onLoaded: (c) => _controller
                ..duration = c.duration
                ..repeat()),
          BulletedText(widget.text)
        ],
      ),
      id: widget.id,
    );
  }
}
