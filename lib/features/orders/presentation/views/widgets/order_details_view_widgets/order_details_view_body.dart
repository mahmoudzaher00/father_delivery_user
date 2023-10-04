import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';
import '../../../../../../core/utils/play_audio_helper.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../custom_order_info_details_widget.dart';
import '../custom_order_state_widget.dart';
import '../new_order_view_widgets/custom_picked_image_list_view.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
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
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, bool>{}) as Map;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h,horizontal:20.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            color: ColorManager.primaryGray,
            boxShadow: ContainerManager.shadow,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CustomImage(
                    image:arguments['generalOrder']?ImageAssets.pharmacy:ImageAssets.baik,
                    radiusCircleAvatar: 30,
                    circleColor: ColorManager.transparentColor,
                    circleBorderColor: ColorManager.primaryOrange,
                    isAsset: true,
                    isCircular: true,
                    isShadow: false,
                  ),
                  const SizedBox(width: 20,),
                  Text(arguments['generalOrder']?'اسم المتجر':'مطعم البيك',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,
                    ),),
                  if(arguments['generalOrder'])
                    const Spacer(),
                  if(arguments['generalOrder'])
                    Text('250.00 ر.س',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16.sp,
                        color: ColorManager.primaryOrange
                      ),),
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
           if( arguments['generalOrder'])
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('وقت الوصول',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,
                    ),),
                 Text('10:45 ص',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 14.sp,
                              color: ColorManager.primaryOrange
                          ),),

                ],
              ),
            ),
            if(arguments['generalOrder'])
              const Divider(color: ColorManager.whiteColor,thickness: 2,),
            if(arguments['generalOrder'])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('تفاصيل الطرد',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 16.sp,
                ),
              ),
            ),
            if(arguments['generalOrder'])
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
              child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس، لقد تم توليد هذا النص من مولد النص العربى',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
            if(arguments['generalOrder'])
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.separated(
                    padding:  EdgeInsetsDirectional.symmetric(vertical: 12.h,horizontal: 20,),
                    scrollDirection: Axis.horizontal,
                    itemCount:5,
                    separatorBuilder: (context, index) =>const Padding(padding: EdgeInsetsDirectional.only(end: 15,)) ,
                    itemBuilder:  (context, index) =>
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorManager.whiteColor,

                          ),
                          child: const Icon(CupertinoIcons.photo,size: 20,color: ColorManager.throughLineColor,),
                        )
                  //       CircleAvatar(
                  //   foregroundImage: FileImage((instance<OrdersInputData>().imageList[index]),
                  // ),),
                )
            ),
            if(arguments['generalOrder'])
              buildContainer(context, arguments),
            if(!arguments['generalOrder'])
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('وجبة بروست 7 قطع',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 14.sp,
                    ),),
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(text:'  1*  ',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 14.sp,
                              color: ColorManager.borderColor
                          ),),
                        TextSpan(text: '30.00 ر.س',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16.sp,

                          ),),
                      ]
                  )),

                ],
              ),
            ),
            if(!arguments['generalOrder'])
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('وجبة بروست 7 قطع - سبايسي',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 14.sp,
                    ),),
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(text:'  1*  ',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 14.sp,
                              color: ColorManager.borderColor
                          ),),
                        TextSpan(text: '30.00 ر.س',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16.sp,

                          ),),
                      ]
                  )),

                ],
              ),
            ),
            if(arguments['generalOrder'])
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

                        itemBuilder: (context, index) =>  Icon(
                          index < 3 ? CupertinoIcons.star_fill: CupertinoIcons.star,
                          color: ColorManager.primaryOrange,
                          // color: ColorManager.errorColor,
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
            if(!arguments['generalOrder'])
            const Divider(color: ColorManager.whiteColor,thickness: 2,),
            if(!arguments['generalOrder'])
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
                    '60.00 ر.س',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 18.sp,
                        color: ColorManager.primaryOrange


                    ),
                  )
                ],
              ),
            ),

            CustomElevatedButtonWidget(
                width: SizeConfig.screenWidth!,
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
