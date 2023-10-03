import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';

class CustomDeliveryDestinationWidget extends StatelessWidget {
  final String fromToText;
  final String destinationText;
  const CustomDeliveryDestinationWidget({
    super.key, required this.fromToText, required this.destinationText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20,end: 10,bottom: 12.h),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$fromToText  :  ',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.borderColor),
          ),
          const SizedBox(width: 5,),
          Text(destinationText,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,),
          ),
          const Spacer(),
          IconButton(
              onPressed: (){},
              padding: EdgeInsets.zero,
              tooltip: 'Edit',
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              color: ColorManager.borderColor,
              icon:const Icon(Icons.edit_location_alt_outlined)),
        ],
      ),
    );
  }
}
