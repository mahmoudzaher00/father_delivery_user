import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:father_delivery_user/core/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';

import '../../utils/record_audio_helper.dart';

part 'audio_record_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioRecordInitial());
  static AudioCubit get(context)=>BlocProvider.of(context);
  int _recordDuration = 0;
  Timer? _timer;
  final audioRecord = Record();
  final player = AudioPlayer();
  bool isRecording = false;
  bool isPaused = false;
  String? recordedAudioPath;
  File? recordedAudioFile;
  String? recordName;
  Duration? position;
  Duration? duration;


  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        recordedAudioPath = null;
        recordedAudioFile = null;
        await audioRecord.start();
        isRecording = true;
        isPaused = false;
        _timer?.cancel();

        _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
          _recordDuration++;

        });
        emit(StartRecording());
      }
    } catch (e) {
      print('error start recording $e');
    }
  }

  Future<void> stopRecording({bool save = true}) async {
    _timer?.cancel();
    _recordDuration = 0;
    String? path = await audioRecord.stop();
    print(isRecording);
    print(isPaused);
    if(path!=null) {
      if(save) {
        try {
          print(path);
          isRecording = false;
          isPaused = false;
          recordedAudioPath = path;
          emit(StopRecording());
        } catch (e) {
          print('error stop recording $e');
    }
      }else{
        isRecording=false;
        isPaused = false;
        emit(StopRecording());
      }
    }
  }

  Future<void> saveRecord(BuildContext context, {required String recordedName}) async {
    recordedAudioFile = File(recordedAudioPath!);
    recordName = recordedName;
    print(recordedAudioPath!);
    emit(SaveRecording());
    showToast(message: "Record Saved!", state: ToastStates.success);
  }

  Future<void> pauseRecording() async {
    try {
      await audioRecord.pause();
      isRecording = false;
      isPaused = true;
      emit(PauseRecording());
    } catch (e) {
      print('error pause recording $e');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(recordedAudioPath!);
      await player.play(urlSource);
      emit(PlayingRecord());
    } catch (e) {
      print('error play recording $e');
    }
  }

  Future<void> stopPlaying() async {
    try {
      await player.stop();
      emit(StopPlayingRecord());
    } catch (e) {
      print('error stop play recording $e');
    }
  }

  Future<void> disposeRecord() async {
    try {
      await audioRecord.dispose();
      isRecording = false;
      isPaused = false;
      recordedAudioPath = null;
      recordedAudioFile = null;
      emit(DisposeRecord());
    } catch (e) {
      print('error dispose recording $e');
    }
  }

  String formatNumber(NumberTypes type) {
    int number = 0;
    if (type == NumberTypes.seconds) {
      number = _recordDuration % 60;
    } else {
      number = _recordDuration ~/ 60;
    }
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }
    return numberStr;
  }
}

