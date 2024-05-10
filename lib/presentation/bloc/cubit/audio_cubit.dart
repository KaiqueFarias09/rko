import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_cubit.freezed.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit()
      : _player = AudioPlayer(),
        super(const AudioState());

  final AudioPlayer _player;
  final assetsPath = 'assets/audios';

  Future<void> play(String file) async {
    await _player.setVolume(1);
    await _player.setAsset('$assetsPath/$file.mp3');
    await _player.play();
  }

  Future<void> stop() => _player.stop();

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}