part of 'audio_cubit.dart';

enum AudioStatus { initial, playing, error, stopped, muted }

@freezed
abstract class AudioState with _$AudioState {
  const factory AudioState({
    @Default(AudioStatus.initial) status,
    @Default('') String currentTrack,
  }) = _AudioState;
}
