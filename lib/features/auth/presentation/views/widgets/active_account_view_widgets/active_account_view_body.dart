import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_record_data_button.dart';
import 'custom_skip_button.dart';

class ActiveAccountViewBody extends StatelessWidget {
  const ActiveAccountViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgAssets.activeAccount,
          height: SizeConfig.screenHeight!*.5,

        ),
        const SizedBox(height: 30,),
        Text('تم تفعيل حسابك',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24.sp),),
        const SizedBox(height: 10,),
        Text('الآن بإمكانك التسوق و الحصول على أفضل العروض',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),),
        const SizedBox(height: 60,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CustomRecordDataButton(),
            CustomSkipButton()
          ],
        )


      ],
    );
  }
}




