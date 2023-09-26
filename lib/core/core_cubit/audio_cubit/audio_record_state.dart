part of 'audio_record_cubit.dart';

@immutable
abstract class AudioState {}

class AudioRecordInitial extends AudioState {}
class StartRecording extends AudioState {}
class StopRecording extends AudioState {}
class SaveRecording extends AudioState {}
class PauseRecording extends AudioState {}
class PlayingRecord extends AudioState {}
class StopPlayingRecord extends AudioState {}
class DisposeRecord extends AudioState {}
