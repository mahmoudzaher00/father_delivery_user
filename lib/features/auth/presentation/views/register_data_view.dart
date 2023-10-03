import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';
import 'widgets/register_data_view_widget/register_data_view_body.dart';

class RegisterDataView extends StatelessWidget {
  const RegisterDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 50,
        titleContent: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'تسجيل بياناتك',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),

        body: const RegisterDataViewBody(),
);
  }
}
