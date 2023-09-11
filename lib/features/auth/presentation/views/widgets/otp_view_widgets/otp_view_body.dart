import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/app/constants.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../custom_father_delivery_rich_text_widget.dart';
import 'custom_active_account_button.dart';
import 'custom_otp_text_field.dart';
import 'custom_resend_otp_code_widget.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(builder: (BuildContext context, constraints) {
          final scrolled = constraints.scrollOffset > 0;
          return SliverAppBar(
            toolbarHeight: 65,
            systemOverlayStyle: Constants.systemUiOverlayStyle,
            leadingWidth: 65,
            leading: FittedBox(
              child: Padding(
                padding:  const EdgeInsetsDirectional.only(start: 16),
                child: ElevatedButton(
                  onPressed: ()=>Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor:ColorManager.whiteColor,
                    minimumSize: const Size(54, 40)
                  ),
                  child: const Icon(Icons.arrow_back,size: 30,color: ColorManager.primaryBlack,),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: SizeConfig.screenHeight! * .45,
            backgroundColor: scrolled ? ColorManager.primaryOrange : Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                titlePadding: scrolled ?
                const EdgeInsetsDirectional.only(top: 20,bottom: 12,start: 30) : EdgeInsets.zero,
                centerTitle: true,
                title: SvgPicture.asset(
                  SvgAssets.deliveryWorker,
                  height: 100,
                ),
                background: Column(
                  children: [
                    if(!scrolled)
                      SizedBox(
                        height: SizeConfig.screenHeight! * .41,
                        width: SizeConfig.screenWidth,
                        child: SvgPicture.asset(
                          SvgAssets.authTopShape,
                          fit: BoxFit.fill,
                        ),
                      ),
                  ],
                )),
          );
        }),
        SliverList(delegate:  SliverChildListDelegate.fixed([
          const CustomFatherDeliveryRichTextWidget(),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 40.h, start: 20),
            child: Text(
              'تفعيل الحساب',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18.sp),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 10.h, start: 20, bottom: 22.h),
            child: Text(
              'أدخل كود التفعيل المرسل إلى هاتفك',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp, color: ColorManager.hintTextColor),
            ),
          ),
          const CustomOtpTextField(),
          const CustomResendOtpCodeWidget(),
          const CustomActiveAccountButton()

        ]))
      ],
    );
  }
}


