import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_image_widget.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20,end: 20,top: 16.h,bottom: 12.h),
      itemCount: 10,
        itemBuilder:  (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            margin:  const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: ColorManager.primaryGray,
              borderRadius: BorderRadius.circular(5),
              boxShadow: ContainerManager.shadow
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  image:index%2==0? ImageAssets.pharmacy:ImageAssets.baik,
                  isAsset: true,
                  isCircular: true,
                  isShadow: false,
                  circlePadding: 2

                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'مطعم البيك',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),
                        ),


                      ],
                    ),
                    SizedBox(height: 8.h,),
                    Text(
                      'بروست و مسحب',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 12.sp,color: ColorManager.borderColor),
                    ),
                    SizedBox(height: 8.h,),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text:'حى البيان , الرياض   ',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 14.sp,
                            ),),
                          TextSpan(text:'(5.01 Km يبعد مسافة)',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 12.sp,
                                color: ColorManager.borderColor
                            ),),
                        ]
                    )),


                  ],
                ),
                const Spacer(),
                IconButton(
                    padding:  EdgeInsets.zero,
                    visualDensity:  const VisualDensity(horizontal: -4,vertical: -4),
                    onPressed: (){},
                    iconSize: 20,
                    icon: const Icon(CupertinoIcons.xmark_circle,color: ColorManager.gray500,)),

              ],
            ),
          );
        },);
  }
}
