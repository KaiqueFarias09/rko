part of 'audio_cubit.dart';

enum AudioStatus { initial, playing, error, stopped }

@freezed
abstract class AudioState with _$AudioState {
  const factory AudioState({
    @Default(AudioStatus.initial) status,
  }) = _AudioState;
}
