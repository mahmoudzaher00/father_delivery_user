import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';

class CustomOrderStateWidget extends StatelessWidget {
  final String? orderState;
  const CustomOrderStateWidget({super.key, this.orderState='فى الطريق للمتجر',});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:4.h,top: 4.h,end: 10.w ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('#37056221',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 14.sp,
            ),),
          SizedBox(width: 2.w,),
          Text('25 / 07 / 2022',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 14.sp,
                color: ColorManager.borderColor
            ),),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
            width: 105.w,
            decoration: BoxDecoration(
                color: orderState!='منتهى'? ColorManager.successColor:ColorManager.lightOrange,
                borderRadius: BorderRadius.circular(22)
            ),
            child: Text(
              orderState!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 12.sp,
                  color: ColorManager.whiteColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}