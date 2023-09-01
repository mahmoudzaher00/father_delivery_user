import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';


final navigatorKey =GlobalKey<NavigatorState>();

enum SnackBarType {
  success,
  error,
  warning,
  normal,
}


class SnackBarMessage {
  static void showSuccessSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(

      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorManager.successColor,
    ));
  }

  static void showErrorSnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorManager.errorColor,

        action: SnackBarAction(
          label: AppStrings.forgotPassword.tr(),
          textColor: ColorManager.blackColor,
          onPressed: () {},
        )));
  }
  static void showInternetConnectionSnackBar(context, message,icon) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(icon,color: Colors.white,),
            const SizedBox(width: 10,),
            Text(message, style: const TextStyle(color: Colors.white),),

          ],
        ),
        backgroundColor: Colors.grey.shade500,
       ));
  }
}


enum MessageType { success, fail, warning }

void showToast1(String msg,context,
    {int duration = 2,
      MessageType msgType = MessageType.fail,
      bool backFromScreen = false,
      bool closeLoading = false}) async {

  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        elevation: 0,
        backgroundColor: getBgColor(msgType),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
        content: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 11.h),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                 'ImageAssets.visa',
                  fit: BoxFit.scaleDown,
                  height: 19.h,
                  width: 24.h,
                  color: getBgColor(msgType),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(msg,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white)),
            ),
            Container(
              height: 24.h,
              width: 24.h,
              padding: EdgeInsets.all(5.r),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: SvgPicture.asset(
                getToastIcon(msgType),
                // fit: BoxFit.scaleDown,
                height: 19.h,
                width: 24.h,
                color: getBgColor(msgType),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getBgColor(MessageType msgType) {
  return msgType == MessageType.success
      ? const Color(0xff53A653)
      : msgType == MessageType.warning
      ? const Color(0xffFFCC00)
      : const Color(0xffEF233C);
}

String getToastIcon(MessageType msgType) {
  return msgType == MessageType.success
      ? 'SvgAssets.iconGallery'
      : msgType == MessageType.warning
      ?' SvgAssets.deleteCard'
      : 'SvgAssets.delete';
}