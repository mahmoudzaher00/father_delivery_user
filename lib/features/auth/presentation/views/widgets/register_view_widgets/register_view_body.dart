import 'package:father_delivery_user/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/app/constants.dart';
import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../auth_input_data.dart';
import '../custom_father_delivery_rich_text_widget.dart';
import 'custom_go_login_text.dart';
import 'custom_register_button.dart';
import 'custom_register_phone_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  void initState() {
    instance<AuthInputData>().registerPhoneController.addListener(instance<RegisterCubit>().formatInput);
    // context.read<RegisterCubit>().authInputData.registerPhoneController.addListener(context.read<RegisterCubit>().formatInput);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(slivers: [
      SliverLayoutBuilder(builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 0;
        return SliverAppBar(
          toolbarHeight: 65,
          systemOverlayStyle: Constants.systemUiOverlayStyle,
          titleSpacing: scrolled?4:16,
          pinned: true,
          automaticallyImplyLeading: false,
          expandedHeight: SizeConfig.screenHeight! * .45+7,
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
                      height: SizeConfig.screenHeight! * .42,
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
      SliverList(delegate: SliverChildListDelegate.fixed([
        const CustomFatherDeliveryRichTextWidget(),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 40.h, start: 20),
          child: Text(
            'تسجيل حساب جديد',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18.sp),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 10.h, start: 20, bottom: 22.h),
          child: Text(
            'أدخل رقم هاتفك لتفعيل الحساب',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp, color: ColorManager.hintTextColor),
          ),
        ),
        const CustomRegisterPhoneTextField(),
        const CustomRegisterButton(),
        const CustomGoLoginText()

      ]))
    ]);
  }
}
