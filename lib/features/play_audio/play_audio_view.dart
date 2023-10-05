// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../core/core_cubit/audio_cubit/audio_record_cubit.dart';
// import '../../core/resources/color_manager.dart';
// import '../../core/utils/play_audio_helper.dart';
// import '../../core/utils/size_config.dart';
//
// class PlayAudio extends StatefulWidget {
//   const PlayAudio({Key? key}) : super(key: key);
//
//   @override
//   State<PlayAudio> createState() => _PlayAudioState();
// }
//
// class _PlayAudioState extends State<PlayAudio> {
//   PlayAudioHelper playAudioHelper = PlayAudioHelper();
//
//   @override
//   initState(){
//
//     playAudioHelper.init(setState);
//
//     super.initState();
//   }
//   @override
//   dispose(){
//     playAudioHelper.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     playAudioHelper.beforeSliderBuild();
//     return Scaffold(
//       body:   Column(
//         children: [
//           Center(
//             child: Container(
//               height: 120,
//               width: SizeConfig.screenWidth,
//               padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
//               margin: EdgeInsets.only(top: 12.h,),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: ColorManager.whiteColor
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const CircleAvatar(
//                     backgroundColor: ColorManager.primaryGray,
//                     child: Icon(CupertinoIcons.person_fill,color: ColorManager.borderColor,),
//                   ),
//                   Expanded(
//                     child: Builder(
//                         builder: (context) {
//                           playAudioHelper.beforeSliderBuild();
//
//                           return Slider(
//                               value: playAudioHelper.getSliderValue(),
//                               activeColor: ColorManager.primaryOrange,
//                               onChanged: playAudioHelper.onSliderChange
//                           );
//                         }
//                     ),
//                   ),
//                   if(playAudioHelper.position!=null)
//                     Text(
//                         RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$remaining")?.group(1) ?? '$remaining',
//                         style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.throughLineColor,fontSize: 15.sp)),
//                   IconButton(
//                       onPressed: () {
//                         if(playAudioHelper.isPlaying()){
//                           playAudioHelper.pause();
//                         }else
//                         {
//                           // AudioCubit.get(context).playRecording();
//                           playAudioHelper.play('https://edmarkk.com/maas/public/storage/tasks/October2023/files/1696377212.wav');
//                         }
//                         setState((){});
//
//
//                         // widget.playAudioHelper.play(widget.model.body);
//                       },
//                       icon: Icon(
//                         playAudioHelper.isPlaying() ? CupertinoIcons.pause : CupertinoIcons.play_fill,
//                         color:Theme.of(context).dividerColor,size: 20,
//                       )),
//
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       )
//     );
//   }
//   Duration get remaining => playAudioHelper.duration! - playAudioHelper.position!;
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../core/core_cubit/audio_player_cubit/audio_player_cubit.dart';



class PlayAudio extends StatelessWidget {
  const PlayAudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AudioPlayerCubit(),
      child: const PlayAudioContent(),
    );
  }
}
class PlayAudioContent extends StatelessWidget {
  const PlayAudioContent({super.key});

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioPlayerCubit>(context);
    audioCubit.init();
    return Scaffold(
      body: Center(
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(CupertinoIcons.person_fill, color: Colors.black),
              ),
              Expanded(
                child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
                  builder: (context, audioState) {
                    double sliderValue = 0.0;
                    if (audioCubit.duration != null && audioCubit.position != null) {
                      sliderValue = audioCubit.position!.inMilliseconds / audioCubit.duration!.inMilliseconds;
                    }
                    return Slider(
                      value: sliderValue,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        audioCubit.seek(value);
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
                builder: (context, audioState) {
                  if (
                  audioState is AudioPlayerPositionUpdated||
                  audioState is AudioPlayerPlaying ||
                      audioCubit.position != null ||
                      audioCubit.duration != null) {
                    final remainingDuration = audioCubit.duration! - audioCubit.position!;
                    final remainingText = formatDuration(remainingDuration);
                    return Text(
                      remainingText,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    );
                  } else {
                    return const SizedBox(); // Hide the time when not playing
                  }
                },
              ),
              BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
                builder: (context, audioState) {
                  return IconButton(
                    onPressed: () {
                      if (audioState is AudioPlayerPlaying) {
                        audioCubit.pause();
                      } else {
                        audioCubit.play(
                            'https://edmarkk.com/maas/public/storage/tasks/October2023/files/1696377212.wav');
                      }
                    },
                    icon: Icon(
                      audioState is AudioPlayerPlaying
                          ? CupertinoIcons.pause
                          : CupertinoIcons.play_fill,
                      color: Colors.black,
                      size: 20,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}





