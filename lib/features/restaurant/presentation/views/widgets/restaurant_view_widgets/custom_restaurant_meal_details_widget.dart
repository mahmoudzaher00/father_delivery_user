import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';

class CustomRestaurantMealDetailsWidget extends StatelessWidget {
  const CustomRestaurantMealDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CustomImage(
                ImageAssets.restOffer,
                isNetwork: false,
                isShadow: false,
                width: SizeConfig.screenWidth!,
                height: 220.h,
                fit: BoxFit.fill,
                borderRadius: BorderRadius.circular(5),

              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.throughLineColor,
                    surfaceTintColor: Colors.transparent,
                    foregroundColor: ColorManager.primaryOrange,
                    padding: EdgeInsets.zero,
                    elevation: 4,
                    minimumSize: const Size(28, 28),
                    shape: const CircleBorder()
                ),
                child: Container(height:28,
                  width: 28,
                  // margin: const EdgeInsets.all(8.0),
                  decoration:   const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffEF554A), Color(0xffFF8C69),]),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgAssets.cartIcon,height: 16,),
                      ],
                    )),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                    margin:  EdgeInsetsDirectional.only(top: 174.h,start: 8.w,end: 8.w),
                    // height: 28,
                    decoration:   BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffCCCCCC)
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star,color: ColorManager.primaryOrange,size: 15,),
                        const SizedBox(width: 2,),
                        Text('3.6',
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 12.sp,
                              color: ColorManager.primaryOrange),),
                        const SizedBox(width: 3,),
                        Text('(19.00 تقيم)',
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 10.sp,
                              color: ColorManager.hintTextColor),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),

          Row(
            children: [
              Text('بروست 5 قطع',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,color: ColorManager.primaryBlack),),
              const Spacer(),
              Text('19.00 ر.س',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,color: ColorManager.primaryOrange),),



            ],
          )
        ],
      ),
    );
  }
}
