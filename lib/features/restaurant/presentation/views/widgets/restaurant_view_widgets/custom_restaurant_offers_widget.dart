import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/routes_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRestaurantOfferWidget extends StatelessWidget {
  const CustomRestaurantOfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, Routes.mealIngredientsRoute),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                CustomImage(
                  image:ImageAssets.restOffer,
                  isNetwork: false,
                  isShadow: false,
                  width: SizeConfig.screenWidth!,
                  height: 220.h,
                  borderRadius: BorderRadius.circular(5),

                ),
                Container(
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.all(8),
                  height: 28,
                  width: 100,
                  // margin: const EdgeInsets.all(8.0),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffEF554A), Color(0xffFF8C69),]),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      foregroundColor: ColorManager.extraLightOrange,
                      padding: EdgeInsets.zero,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                      )
                    ),
                    label: SvgPicture.asset(SvgAssets.cartIcon,height: 15,),
                    icon: Text('أضف للسلة',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.whiteColor,fontSize: 11),),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Text('2 وجبة مسحب 6 قطع + بيبسى + بطاطس',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
            SizedBox(height: 10.h,),

            Row(
              children: [
                Text('19.00 ر.س',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.primaryOrange),),
                const SizedBox(width: 10,),
                Text('25.00 ر.س ',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16.sp,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: ColorManager.throughLineColor,
                      decorationThickness: 2,
                      color: ColorManager.throughLineColor),),
                const Spacer(),
                const Icon(Icons.star,color: ColorManager.primaryOrange,size: 15,),
                const SizedBox(width: 5,),
                Text('3.6',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 11.sp,
                      color: ColorManager.primaryOrange),),
                const SizedBox(width: 5,),
                Text('(19.00 تقيم)',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 11.sp,
                      color: ColorManager.hintTextColor),),


              ],
            )
          ],
        ),
      ),
    );
  }
}
