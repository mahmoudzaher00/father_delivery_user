import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/core_cubit/audio_cubit/audio_record_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/play_audio_helper.dart';
import '../../../../../../core/utils/record_audio_helper.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_lottie_widget.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../orders_input_data.dart';
import 'custom_picked_image_list_view.dart';

class CustomOrderDetailsTextField extends StatefulWidget {
  const CustomOrderDetailsTextField({
    super.key,
  });

  @override
  State<CustomOrderDetailsTextField> createState() => _CustomOrderDetailsTextFieldState();
}

class _CustomOrderDetailsTextFieldState extends State<CustomOrderDetailsTextField> {
  var path;
  final myRecorder = RecordAudioHelper();
  PlayAudioHelper playAudioHelper = PlayAudioHelper();
  late PlayerController playerController;

  @override
  initState(){
    myRecorder.init(setState);
    playAudioHelper.init(setState);
    playerController = PlayerController();
    super.initState();
  }
  @override
  dispose(){
    myRecorder.dispose();
    playAudioHelper.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    playAudioHelper.beforeSliderBuild();
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        return Column(
          children: [
           !AudioCubit.get(context).isRecording&&!AudioCubit.get(context).isPaused?
            CustomTextField(
              width: SizeConfig.screenWidth,
              isShadow: false,
              hintText: 'تفاصيل الطلب...',
              filledColorTextFiled: true,
              fillColorTextFiled: ColorManager.whiteColor,
              focusedBorderColor: ColorManager.whiteColor,
              hintTextSize: 14.sp,
              maxLines: 3,
              suffixIconWidget: Container(
                height: 70,
                margin: const EdgeInsetsDirectional.only(end: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      GestureDetector(
                        onLongPress: (){},
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                            iconSize: 22,
                            onPressed: () {
                              instance<OrdersInputData>().buildSelectImageAlertDialog(context);
                            },
                            icon: const Icon(
                              CupertinoIcons.photo,
                              color: ColorManager.borderColor,
                            )
                        ),
                      ),
                      GestureDetector(
                        onLongPress: (){},
                        child:
                        IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 20,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                            onPressed:  ()async{
                              await AudioCubit.get(context).startRecording();
                              },
                            icon: const Icon(
                              CupertinoIcons.mic,
                              color: ColorManager.borderColor,
                            )),
                      ),
                  ],
                ),
              ),
            ):
            Container(
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorManager.whiteColor

              ),
              child: Row(
                children: [
                  if(AudioCubit.get(context).isRecording)
                  CustomLottieWidget(
                    height: 50,
                    width: 50,
                  ),
                  if(AudioCubit.get(context).isPaused)
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(CupertinoIcons.mic_circle_fill,color: ColorManager.primaryOrange,),
                    ),
                  Text(
                    "${AudioCubit.get(context).formatNumber(NumberTypes.minutes)}:${AudioCubit.get(context).formatNumber(NumberTypes.seconds)}",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.throughLineColor,fontSize: 15.sp)),


                  const Spacer(),
                    if(!AudioCubit.get(context).isRecording)
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(horizontal: -1,vertical: -1),
                      onPressed: ()async{
                       await AudioCubit.get(context).startRecording();
                      },
                      icon: const Icon(CupertinoIcons.mic,color:ColorManager.borderColor,size: 22,),),
                  if(AudioCubit.get(context).isRecording)
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(horizontal: -1,vertical: -1),
                      onPressed: ()async{
                        await AudioCubit.get(context).pauseRecording();
                      },
                      icon: const Icon(CupertinoIcons.pause,color:ColorManager.borderColor,size: 23,),),
                  if(AudioCubit.get(context).isRecording||AudioCubit.get(context).isPaused)
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(horizontal: -1,vertical: -1),
                      onPressed: ()async{
                        await AudioCubit.get(context).stopRecording(save: false);
                      },
                      icon: const Icon(CupertinoIcons.trash,color:ColorManager.borderColor,size: 22,),),
                  if(AudioCubit.get(context).isRecording||AudioCubit.get(context).isPaused)
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(horizontal: -1,vertical: -1),
                      tooltip: 'ارسال',
                      onPressed: ()async{
                        await AudioCubit.get(context).stopRecording();
                      },
                      icon: Transform.rotate(
                          angle: 10.2,
                          child: const Icon(CupertinoIcons.paperplane,color:ColorManager.borderColor,size: 22,)),),

                ],
              ),
            ),
            if(AudioCubit.get(context).recordedAudioPath!=null)
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    margin: EdgeInsets.only(top: 12.h,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorManager.whiteColor
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       const CircleAvatar(
                         backgroundColor: ColorManager.primaryGray,
                         child: Icon(CupertinoIcons.person_fill,color: ColorManager.borderColor,),
                       ),
                        Expanded(
                          child: Builder(
                              builder: (context) {
                                playAudioHelper.beforeSliderBuild();

                                return Slider(
                                    value: playAudioHelper.getSliderValue(),
                                    activeColor: ColorManager.primaryOrange,
                                    onChanged: playAudioHelper.onSliderChange
                                );
                              }
                          ),
                        ),
                        if(playAudioHelper.position!=null)
                          Text(
                              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$remaining")?.group(1) ?? '$remaining',
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.throughLineColor,fontSize: 15.sp)),
                        IconButton(
                            onPressed: () {
                              if(playAudioHelper.isPlaying()){
                                playAudioHelper.pause();
                              }else
                              {
                                // AudioCubit.get(context).playRecording();
                                playAudioHelper.play(AudioCubit.get(context).recordedAudioPath!);
                              }
                              setState((){});


                              // widget.playAudioHelper.play(widget.model.body);
                            },
                            icon: Icon(
                              playAudioHelper.isPlaying() ? CupertinoIcons.pause : CupertinoIcons.play_fill,
                              color:Theme.of(context).dividerColor,size: 20,
                            )),

                      ],
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(horizontal: -4,vertical: -1.4),
                      onPressed: () {
                        playAudioHelper.stop();
                        playAudioHelper.delete(AudioCubit.get(context).recordedAudioPath);
                        AudioCubit.get(context).recordedAudioPath=null;
                        setState((){});
                      },
                      icon: const Icon(
                        CupertinoIcons.xmark_circle,
                        color:ColorManager.errorColor,size: 20,
                      )),
                ],
              ),
            const CustomPickedImageListView()




            ],
        );
  },
);
  }
  Duration get remaining => playAudioHelper.duration! - playAudioHelper.position!;
}

