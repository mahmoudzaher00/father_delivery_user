import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/features/auth/presentation/views/auth_input_data.dart';
import 'package:flutter/material.dart';

// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui' as ui;

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/constants_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Directionality(
          // Specify direction if desired
          textDirection: ui.TextDirection.ltr,
          child: Pinput(
            textInputAction: TextInputAction.done,

            textCapitalization: TextCapitalization.none,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            animationDuration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
            keyboardType: TextInputType.number,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            showCursor: true,
            closeKeyboardWhenCompleted: true,
            defaultPinTheme: PinTheme(
              padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: 54,
                height: 54,
                textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20,),
                decoration: BoxDecoration(
                  color: ColorManager.primaryGray,
                  boxShadow: ContainerManager.shadow,
                  borderRadius: BorderRadius.circular(5),
                )),
            validator: (value) {
              return value == '2222' ? null : 'Pin is incorrect';
            },
            // onClipboardFound: (value) {
            //   debugPrint('onClipboardFound: $value');
            //   pinController.setText(value);
            // },
            hapticFeedbackType: HapticFeedbackType.disabled,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
          )),
    );
  }
}
