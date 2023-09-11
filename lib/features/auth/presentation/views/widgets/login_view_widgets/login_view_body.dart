import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/app/constants.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../auth_input_data.dart';
import '../custom_father_delivery_rich_text_widget.dart';
import 'custom_create_account_text.dart';
import 'custom_login_button.dart';
import 'custom_login_phone_text_field.dart';
import 'custom_skip_login_button_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  void initState() {
    instance<AuthInputData>().loginPhoneController.addListener(instance<LoginCubit>().formatInput);
    super.initState();
  }
  @override
  void dispose() {
    instance<AuthInputData>().loginPhoneController.removeListener(instance<LoginCubit>().formatInput);
    instance<AuthInputData>().loginPhoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<LoginCubit>(),
      child: CustomScrollView(slivers: [
        SliverLayoutBuilder(builder: (BuildContext context, constraints) {
          final scrolled = constraints.scrollOffset > 0;
          return SliverAppBar(
            toolbarHeight: 65,
            automaticallyImplyLeading: false,
            systemOverlayStyle: Constants.systemUiOverlayStyle,
            title: const CustomSkipLoginButtonWidget(),
            titleSpacing: scrolled?4:16,
            pinned: true,
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
              'تسجيل الدخول',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18.sp),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 10.h, start: 20, bottom: 22.h),
            child: Text(
              'أدخل رقم الهاتف المسجل في حسابك',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp, color: ColorManager.hintTextColor),
            ),
          ),
          const CustomLoginPhoneTextField(),
          const CustomLoginButton(),
          const CustomCreateAccountText()

        ]))
    ]),
);

  }
}




