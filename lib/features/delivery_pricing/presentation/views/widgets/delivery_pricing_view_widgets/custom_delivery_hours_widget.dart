import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_delivery_hours_counter_widget.dart';

class CustomDeliveryHoursWidget extends StatelessWidget {
  const CustomDeliveryHoursWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('وقت الوصول / ساعة',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 16.sp,
            ),),
          const CustomDeliveryHoursCounterWidget(),
        ],
      ),
    );
  }
}
