import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_elevated_button_widget.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:father_delivery_user/features/orders/presentation/views/widgets/custom_order_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/utils/play_audio_helper.dart';
import '../custom_order_info_details_widget.dart';
import '../new_order_view_widgets/custom_picked_image_list_view.dart';

class TrackOrderViewBody extends StatefulWidget {
  const TrackOrderViewBody({Key? key}) : super(key: key);

  @override
  State<TrackOrderViewBody> createState() => _TrackOrderViewBodyState();
}

class _TrackOrderViewBodyState extends State<TrackOrderViewBody> {
  PlayAudioHelper playAudioHelper = PlayAudioHelper();

  @override
  initState(){
    playAudioHelper.init(setState);

    super.initState();
  }
  @override
  dispose(){
    playAudioHelper.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    playAudioHelper.beforeSliderBuild();
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, bool>{}) as Map;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        margin: EdgeInsets.symmetric(vertical: 16.h,horizontal:20.w),
        decoration: BoxDecoration(
          color: ColorManager.primaryGray,
          boxShadow: ContainerManager.shadow,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            arguments['specialOrder']?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('توصيل طابعة',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),

                  Text('250.00 ر.س',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16.sp,
                        color: ColorManager.primaryOrange
                      ),
                  )
                ],
              ),
            ):
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CustomImage(
                    image:ImageAssets.pharmacy,
                    radiusCircleAvatar: 30,
                    isAsset: true,
                    isCircular: true,
                    isShadow: false,
                    height: 30,
                    width: 40,

                  ),
                  const SizedBox(width: 20,),
                  Text('صيدلية صحة زينة',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),)
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            const Divider(color: ColorManager.whiteColor,thickness: 2,),
            SizedBox(height: 12.h,),
            const CustomOrderInfoDetailsWidget(),
            const Divider(color: ColorManager.whiteColor,thickness: 2,),
            const CustomOrderStateWidget(),
            const Divider(color: ColorManager.whiteColor,thickness: 2,),
            arguments['specialOrder']?
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('وقت الوصول',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,
                    ),),
                  Text(
                    '10 : 15 ص',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 14.sp,
                      color: ColorManager.primaryOrange

                    ),
                  )
                ],
              ),
            ):
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('قيمة الطلب',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 14.sp,
                    ),),
                  Text(
                    '350.00 ر.س',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16.sp,

                    ),
                  )
                ],
              ),
            ),
            if( arguments['specialOrder'])
              const Divider(color: ColorManager.whiteColor,thickness: 2,),
            arguments['specialOrder']?
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('رقم المستقبل',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,
                    ),),
                  Text(
                    '+966 50 257 2598',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 14.sp,

                    ),
                  )
                ],
              ),
            ):
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text:'التوصيل   ',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 14.sp,
                        ),),
                      TextSpan(text:'(5.01 Km)',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 14.sp,
                          color: ColorManager.borderColor
                        ),),
                    ]
                  )),

                  Text(
                    '12.00 ر.س',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16.sp,

                    ),
                  )
                ],
              ),
            ),
            const Divider(color: ColorManager.whiteColor,thickness: 2,),
            if(!arguments['specialOrder'])
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:30.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المبلغ الإجمالى',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,),
                  ),
                  Text(
                    '362.00 ر.س',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 18.sp,
                      color: ColorManager.primaryOrange


                    ),
                  )
                ],
              ),
            ),
            if(arguments['specialOrder'])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('تفاصيل الطرد',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            if(arguments['specialOrder'])
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
                child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس، لقد تم توليد هذا النص من مولد النص العربى',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            if(arguments['audioFile']!=null)
              // CustomAudioPlayerWidget(filePath: arguments['audioFile'],),
              buildContainer(context, arguments),
            if(arguments['imageList']!=null)
               const CustomPickedImageListView(deleteImage: false,),
            if(arguments['specialOrder'])
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 16.h),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: ColorManager.whiteColor,
                      child: Icon(CupertinoIcons.person_fill,color: ColorManager.borderColor,),
                    ),
                    const SizedBox(width: 14,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('تفاصيل الطرد',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                        RatingBarIndicator(
                          rating:3,
                          unratedColor: ColorManager.dividerColor,

                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: ColorManager.errorColor,
                          ),
                          itemCount: 5,
                          itemSize: 18.h,
                          direction: Axis.horizontal,
                          itemPadding: EdgeInsets.only(top: 7,left: 1.w,right: 1.w,bottom: 4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            CustomElevatedButtonWidget(
                width: SizeConfig.screenWidth!,
                // onPressed:()=>Navigator.pushNamed(context, Routes.loc) ,
                buttonMargin: EdgeInsetsDirectional.only(start: 25.w,end: 20.w ),
                child: Text(
              'تتبع الطلب',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 18.sp,
                  color: ColorManager.whiteColor


              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, Map<dynamic, dynamic> arguments) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
      margin:  const EdgeInsets.symmetric(horizontal: 20),
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
                  playAudioHelper.play(arguments['audioFile']);
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
    );
  }
  Duration get remaining => playAudioHelper.duration! - playAudioHelper.position!;

}
