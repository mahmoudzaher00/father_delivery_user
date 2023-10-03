part of 'audio_player_cubit.dart';

abstract class AudioPlayerState extends Equatable {
  const AudioPlayerState();
}

class AudioPlayerInitial extends AudioPlayerState {
  @override
  List<Object> get props => [];
}
