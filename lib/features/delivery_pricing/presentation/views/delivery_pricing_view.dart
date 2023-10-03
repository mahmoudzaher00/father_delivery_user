import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/widgets/custom_elevated_button_widget.dart';
import 'package:father_delivery_user/features/delivery_pricing/presentation/views/delivery_pricing_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import 'widgets/delivery_pricing_view_widgets/delivery_pricing_view_body.dart';

class DeliveryPricingView extends StatelessWidget {
  const DeliveryPricingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 50,
        titleContent: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'تسعير توصيلة',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
      body: const DeliveryPricingViewBody(),
      bottomNavigationBar: CustomElevatedButtonWidget(
        onPressed: ()=>Navigator.pushNamed(
            context,
            Routes.deliveryPricingDetailsRoute,
            arguments: {
              'hoursCount':instance<DeliveryPricingInputData>().value
            }
        ),
        buttonMargin: EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
        buttonText: 'متابعة',


      ),

    );
  }
}
