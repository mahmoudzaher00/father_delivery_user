
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:flutter/foundation.dart';
part 'audio_player_state.dart';



class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final ap.AudioPlayer _audioPlayer = ap.AudioPlayer();
  Duration? position;
  Duration? duration;
  bool canSetValue = false;
  late StreamSubscription<void> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;

  AudioPlayerCubit() : super(const AudioPlayerInitial());


  void init() async{
    _playerStateChangedSubscription = _audioPlayer.onPlayerComplete.listen((state) async {
      await stop1();
      emit(AudioPlayerStateChanged()); // You can emit a custom state if needed
    });

    _positionChangedSubscription = _audioPlayer.onPositionChanged.listen((position) {
      this.position = position;
      emit(AudioPlayerPositionUpdated(position));
    });

    _durationChangedSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      this.duration = duration;
      emit(AudioPlayerDurationUpdated(duration));
    });
  }
  void play(String source) async {
    if (state is AudioPlayerPlaying) {
      _audioPlayer.pause();
      emit(const AudioPlayerPaused());
    } else {
      await _audioPlayer.play( kIsWeb ? ap.UrlSource(source) : ap.DeviceFileSource(source),);
      emit( AudioPlayerPlaying());
    }
  }

  void pause() {
    if (state is AudioPlayerPlaying) {
      _audioPlayer.pause();
      emit(const AudioPlayerPaused());
    }
  }

  void stop() {
    _audioPlayer.stop();
    emit(const AudioPlayerStopped());
  }



  void seek(double value) {
    if (duration != null) {
      final position = value * duration!.inMilliseconds;
      _audioPlayer.seek(Duration(milliseconds: position.round()));
    }
    emit(Seek());
  }
  double getSliderValue() {
    return canSetValue && duration != null && position != null
        ? position!.inMilliseconds / duration!.inMilliseconds
        : 0.0;

  }

  void updatePosition(Duration position) {
    this.position = position;
    emit(AudioPlayerPositionUpdated(position));
  }

  void updateDuration(Duration duration) {
    this.duration = duration;
    emit(AudioPlayerDurationUpdated(duration));
  }
  Future<void> stop1() => _audioPlayer.stop();
}

