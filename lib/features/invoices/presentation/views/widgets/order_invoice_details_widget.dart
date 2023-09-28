import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInvoiceDetailsWidget extends StatelessWidget {
  const OrderInvoiceDetailsWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,end: 40.w ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('رقم الطلب',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 16.sp,
            ),),
          Text('التاريخ',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 16.sp,
            ),),
          Text('الحالة',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 16.sp,
            ),),
        ],
      ),
    );
  }
}