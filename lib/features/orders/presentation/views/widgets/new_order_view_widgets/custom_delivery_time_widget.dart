import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_delivery_time_counter_widget.dart';

class CustomDeliveryTimeWidget extends StatelessWidget {
  const CustomDeliveryTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('وقت الوصول / ساعة',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),
        ),
        const CustomDeliveryTimeCounterWidget(),
      ],
    );
  }
}