import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/custom_lottie_widget.dart';
import 'size_config.dart';

//TODO:General dialog
customAlertDialog(
    {required BuildContext context,
    String? titleText,
    Color? titleTextColor,
    double? alertDialogHeight,
    Widget? contentTextWidget,
    Widget? customWidget,
    double? height,
    AlignmentGeometry? dialogAlignment,
    EdgeInsets? dialogInsetsPadding,
    ShapeBorder? dialogShape,
    EdgeInsetsGeometry? dialogContentPadding}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1.0,
              sigmaY: 1.0,
            ),
            child: AlertDialog(
                alignment: dialogAlignment ?? Alignment.center,
                backgroundColor: ColorManager.whiteColor,
                surfaceTintColor: Colors.white,
                insetPadding: dialogInsetsPadding ??
                    const EdgeInsets.symmetric(horizontal: 16),
                contentPadding: dialogContentPadding ??
                    const EdgeInsets.symmetric(horizontal: 16),
                shape: dialogShape ??
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s24)),
                content: SizedBox(
                  height: alertDialogHeight ?? AppSize.s265,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Container(
                              height: 24,
                              width: 24,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.lightGray),
                              child: const Icon(
                                FontAwesomeIcons.xmark,
                                color: ColorManager.primaryBlack,
                                size: 17,
                              ),
                            )),
                      ),
                      Text(
                        titleText!,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: titleTextColor!),
                      ),
                      contentTextWidget == null
                          ? const SizedBox.shrink()
                          : const SizedBox(height: AppSize.s18,),
                      contentTextWidget ?? const SizedBox(),
                      SizedBox(height: height ?? AppSize.s20,),
                      customWidget ?? const SizedBox(),
                    ],
                  ),
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: AppConstants.dialogAnimationTime),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

//TODO:Filter dialog
customFilterAlertDialog({
  required BuildContext context,
  String? titleText,
  double? alertDialogHeight,
  Widget? filterWidget,
  Widget? customButtonWidget,
  void Function()? applyOPressed,
  void Function()? clearOPressed,
}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1.0,
              sigmaY: 1.0,
            ),
            child: AlertDialog(
                alignment: Alignment.bottomCenter,
                backgroundColor: ColorManager.whiteColor,
                surfaceTintColor: Colors.white,
                insetPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                content: SizedBox(
                  height: alertDialogHeight ?? AppSize.s265,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              titleText!,
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16.sp),
                            ),
                            TextButton(
                              onPressed: clearOPressed ?? () {},
                              child: Text(
                                AppStrings.clear.tr(),
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    fontSize: 16.sp,
                                    color: ColorManager.primaryOrange),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: ColorManager.primaryGray,
                      ),
                      filterWidget!,
                      const Spacer(),
                      customButtonWidget ??
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: SizedBox(
                              width: SizeConfig.screenWidth!,
                              height: 44,
                              child: ElevatedButton(
                                  onPressed: applyOPressed ?? () {},
                                  child: Text(
                                    AppStrings.apply.tr(),
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontSize: FontSize.s14,
                                        color: ColorManager.whiteColor),
                                  )),
                            ),
                          )
                    ],
                  ),
                )),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: AppConstants.dialogAnimationTime),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

//TODO:Loading dialog
showLoadingDialog({required BuildContext context, String? text, bool? isLottie = false, String? loadingText,}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Column(
            children: [
              isLottie! ?
              CustomLottieWidget(
                height: 80,
                width: 120,
              ) :
              const CircularProgressIndicator(
                strokeWidth: 3,
                color: ColorManager.primaryOrange,
              ),
              const SizedBox(height: 16,),
              Text(
                loadingText ?? AppStrings.pleaseWait.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        );
      });
}

//TODO:Login dialog
showLoginDialog({required BuildContext context,}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.0,
            sigmaY: 1.0,
          ),
          child: AlertDialog(
            titlePadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.lightGray),
                        child: const Icon(
                          FontAwesomeIcons.xmark,
                          color: ColorManager.primaryBlack,
                          size: 17,
                        ),
                      )),
                ),
                CustomLottieWidget(
                  lottieName: JsonAssets.login,
                  height: 250,
                  width: SizeConfig.screenWidth!,
                ),
                const SizedBox(height: 20,),
                Text(
                  AppStrings.loginRequired.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: FontSize.s14, color: ColorManager.primaryBlack),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.loginRoute, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(SizeConfig.screenWidth!, 44)),
                    child: Text(
                      AppStrings.sigIn.tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: FontSize.s14,
                          color: ColorManager.whiteColor,
                          height: 1.2),
                    )),
                const SizedBox(height: 16,),

              ],
            ),
          ),
        );
      });
}
