import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../restaurant/presentation/views/widgets/offer_meal_view_widgets/custom_bottom_navigation_bar_button.dart';
import 'widgets/new_order_view_widgets/new_order_view_body.dart';

class NewOrderView extends StatelessWidget {
  const NewOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 50,
        titleContent: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'طلب جديد',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20.sp,
            ),

          ),
        ),
      ),
      body: const NewOrderViewBody(),
      bottomNavigationBar:  const CustomBottomNavigationBarButton(),
    );
  }
}


