import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/core_cubit/audio_cubit/audio_record_cubit.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/routes_manager.dart';
import 'package:father_delivery_user/features/orders/presentation/views/orders_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomBottomNavigationBarButton extends StatelessWidget {
  const CustomBottomNavigationBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 12),
      child: CustomElevatedButtonWidget(
        onPressed: ()=>Navigator.pushNamed(context, Routes.trackOrderRoute,arguments: {
          'specialOrder':false,
          'audioFile':instance<AudioCubit>().recordedAudioPath,
          'imageList':instance<OrdersInputData>().imageList,
        }),
        child: Text('اطلب',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,color: ColorManager.whiteColor),),

      ),
    );
  }
}