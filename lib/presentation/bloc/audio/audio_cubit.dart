import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_cubit.freezed.dart';
part 'audio_state.dart';

const _assetsPath = 'assets/audios';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit()
      : _audioPlayer = AudioPlayer(),
        super(const AudioState());

  final AudioPlayer _audioPlayer;
  late String _previousFile;
  StreamSubscription<PlayerState>? _audioSubscription;

  void _initListeners() {
    _audioSubscription = _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState != ProcessingState.completed) return;
      emit(const AudioState(status: AudioStatus.stopped));
    });
  }

  Future<void> navigateWithAudioTransition(
    BuildContext context,
    String routeName,
  ) async {
    await stop();
    await Navigator.of(context).pushNamed(routeName);
    await play(_previousFile);
  }

  Future<void> play(String file) async {
    _previousFile = file;
    await _audioPlayer.setAsset('$_assetsPath/$file.mp3');
    _initListeners();
    emit(AudioState(status: AudioStatus.playing, currentTrack: file));
    await _audioPlayer.play();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    if (_audioSubscription != null) await _audioSubscription!.cancel();
    emit(const AudioState(status: AudioStatus.stopped));
  }

  @override
  Future<void> close() {
    if (_audioSubscription != null) _audioSubscription!.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
