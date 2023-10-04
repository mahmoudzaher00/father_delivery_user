part of 'audio_player_cubit.dart';

abstract class AudioPlayerState {
  const AudioPlayerState();
}

class AudioPlayerInitial extends AudioPlayerState {
  const AudioPlayerInitial();
}
class AudioPlayerStateChanged extends AudioPlayerState {
  const AudioPlayerStateChanged();
}

class AudioPlayerPlaying extends AudioPlayerState {
  const AudioPlayerPlaying();
}

class AudioPlayerPaused extends AudioPlayerState {
  const AudioPlayerPaused();
}

class AudioPlayerStopped extends AudioPlayerState {
  const AudioPlayerStopped();
}

class AudioPlayerPositionUpdated extends AudioPlayerState {
  final Duration position;

  const AudioPlayerPositionUpdated(this.position);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioPlayerPositionUpdated && other.position == position;
  }

  @override
  int get hashCode => position.hashCode;
}

class AudioPlayerDurationUpdated extends AudioPlayerState {
  final Duration duration;

  const AudioPlayerDurationUpdated(this.duration);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioPlayerDurationUpdated && other.duration == duration;
  }

  @override
  int get hashCode => duration.hashCode;
}

class Seek extends AudioPlayerState {
  const Seek();
}
