import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';
import 'widgets/delivery_pricing_details_view_widgets/delivery_pricing_details_view_body.dart';

class DeliveryPricingDetailsView extends StatelessWidget {
  const DeliveryPricingDetailsView({Key? key}) : super(key: key);

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
      body: const DeliveryPricingDetailsViewBody(),

    );
  }
}
