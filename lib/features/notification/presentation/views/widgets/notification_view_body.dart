import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30.h),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color:ColorManager.primaryGray,
        boxShadow: ContainerManager.shadow,
        borderRadius: BorderRadius.circular(5)
      ),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>const Divider(
          color: ColorManager.whiteColor,
        ),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder:  (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomImage(
                  image:ImageAssets.baik,
                  isShadow: false,
                  isNetwork: false,
                  isAsset: true,
                   isCircular: true,
                  radiusCircleAvatar: 25,


                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('#37056221',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16.sp,
                            color: ColorManager.primaryBlack
                        )),
                    const SizedBox(height: 10,),
                    Text('المندوب فى الطريق إليك',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 11.sp,
                            color: ColorManager.primaryBlack,
                        ))
                  ],
                ),
                const Spacer(),
                Text( 'منذ 15 دقائق',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 11.sp,
                        color: ColorManager.primaryOrange
                    ))
              ],
            ),
          );

      }, ),
    );
  }
}
