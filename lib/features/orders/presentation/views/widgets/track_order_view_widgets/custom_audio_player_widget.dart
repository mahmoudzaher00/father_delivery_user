import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/core_cubit/audio_player_cubit/audio_player_cubit.dart';
import '../../../../../../core/resources/color_manager.dart';

class CustomAudioPlayerWidget extends StatefulWidget {
  final String filePath;
  const CustomAudioPlayerWidget({Key? key, required this.filePath}) : super(key: key);

  @override
  State<CustomAudioPlayerWidget> createState() => _CustomAudioPlayerWidgetState();
}

class _CustomAudioPlayerWidgetState extends State<CustomAudioPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    print('>>>>>>>${widget.filePath}');
    return BlocProvider(
        create: (context) => AudioPlayerCubit(),
        child: BlocBuilder<AudioPlayerCubit, AudioPlayerStatus>(
          builder: (context, audioPlayerStatus) {
            final audioPlayerCubit = context.read<AudioPlayerCubit>();

            // Calculate remaining time
            final remaining = (audioPlayerCubit.duration?.inSeconds ?? 0) -
                (audioPlayerCubit.position?.inSeconds ?? 0);
            return Column(
              children: [
                Slider(
                  value: audioPlayerCubit.position?.inMilliseconds
                      .toDouble() ??
                      0.0,
                  onChanged: (value) {
                    final position = Duration(milliseconds: value.round());
                    audioPlayerCubit.seekTo(position);
                  },
                  min: 0.0,
                  max: audioPlayerCubit.duration?.inMilliseconds
                      .toDouble() ??
                      100.0,
                  activeColor: ColorManager.primaryOrange,
                ),
                if (remaining != null)
                  Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                        .firstMatch("$remaining")
                        ?.group(1) ??
                        '$remaining',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                      color: ColorManager.throughLineColor,
                      fontSize: 15.sp,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    print(widget.filePath);
                    if (audioPlayerStatus == AudioPlayerStatus.playing) {
                      audioPlayerCubit.pause();
                    } else {
                      audioPlayerCubit.play(
                        widget.filePath,
                      );
                    }
                  },
                  icon: Icon(
                    audioPlayerStatus == AudioPlayerStatus.playing
                        ? CupertinoIcons.pause
                        : CupertinoIcons.play_fill,
                    color: Theme
                        .of(context)
                        .dividerColor,
                    size: 20,
                  ),
                ),
              ],
            );
          },

        ));
  }
}









//   Container(
    //   width: SizeConfig.screenWidth,
    //   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
    //   margin:  const EdgeInsets.symmetric(horizontal: 20),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(8),
    //       color: ColorManager.whiteColor
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       const CircleAvatar(
    //         backgroundColor: ColorManager.primaryGray,
    //         child: Icon(CupertinoIcons.person_fill,color: ColorManager.borderColor,),
    //       ),
    //       Expanded(
    //         child: Builder(
    //             builder: (context) {
    //               playAudioHelper.beforeSliderBuild();
    //
    //               return Slider(
    //                   value: playAudioHelper.getSliderValue(),
    //                   activeColor: ColorManager.primaryOrange,
    //                   onChanged: playAudioHelper.onSliderChange
    //               );
    //             }
    //         ),
    //       ),
    //       if(playAudioHelper.position!=null)
    //         Text(
    //             RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$remaining")?.group(1) ?? '$remaining',
    //             style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.throughLineColor,fontSize: 15.sp)),
    //       IconButton(
    //           onPressed: () {
    //             if(playAudioHelper.isPlaying()){
    //               playAudioHelper.pause();
    //             }else
    //             {
    //               // AudioCubit.get(context).playRecording();
    //               playAudioHelper.play(arguments['audioFile']);
    //             }
    //             setState((){});
    //
    //
    //             // widget.playAudioHelper.play(widget.model.body);
    //           },
    //           icon: Icon(
    //             playAudioHelper.isPlaying() ? CupertinoIcons.pause : CupertinoIcons.play_fill,
    //             color:Theme.of(context).dividerColor,size: 20,
    //           )),
    //
    //     ],
    //   ),
    // );


