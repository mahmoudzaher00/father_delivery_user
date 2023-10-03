import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'audio_player_state.dart';



enum AudioPlayerStatus { stopped, playing, paused }

class AudioPlayerCubit extends Cubit<AudioPlayerStatus> {
  final ap.AudioPlayer _audioPlayer = ap.AudioPlayer();
  Duration? position;
  Duration? duration;

  AudioPlayerCubit() : super(AudioPlayerStatus.stopped);

  Future<void> play(String source) async {
    await _audioPlayer.play(
      kIsWeb ? ap.UrlSource(source) : ap.DeviceFileSource(source),    );
    emit(AudioPlayerStatus.playing);
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    emit(AudioPlayerStatus.paused);
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    emit(AudioPlayerStatus.stopped);
  }

  Future<void> seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void updatePosition(Duration position) {
    this.position = position;
  }

  void updateDuration(Duration duration) {
    this.duration = duration;
  }
}

