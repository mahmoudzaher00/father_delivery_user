import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? fillColorTextFiled;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filledColorTextFiled;
  final TextInputType? textType;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final ValueChanged<String>? onChangedFunction;
  final FormFieldValidator<String>? validatorFunction;
  final VoidCallback? onEditingCompleteFunction;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final bool? obscure;
  final bool isShadow;
  final double? height;
  final double? width;
  final double? vertical;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? errorTextStyle;
  final  Color? cursorColor;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final double? enabledBorderRadius;
  final double? errorBorderRadius;
  final double? focusedBorderRadius;
  final double? focusedErrorBorderRadius;
  final double? widthBorder;
  final int? maxLines;
  final int? errorMaxLines;


  const CustomTextField({super.key, this.controller, this.fillColorTextFiled, this.inputFormatters, this.filledColorTextFiled, this.textType, this.hintStyle, this.hintText, this.onChangedFunction, this.validatorFunction, this.onEditingCompleteFunction, this.focusNode, this.textInputAction, this.prefixIconWidget, this.suffixIconWidget, this.obscure, this.height, this.width, this.vertical, this.labelText, this.labelStyle, this.cursorColor, this.onFieldSubmitted, this.focusedBorderColor, this.enabledBorderColor, this.widthBorder, this.maxLines, this.errorTextStyle, this.enabledBorderRadius, this.focusedBorderRadius, this.inputTextStyle, this.focusedErrorBorderRadius, this.errorBorderRadius, this.errorMaxLines,
  this.isShadow = true
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width??MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: isShadow ? ContainerManager.shadow:ContainerManager.noShadow
      ),
      child: TextFormField(
        controller: controller,
        enableSuggestions: true,
        style:inputTextStyle?? Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
        cursorColor: cursorColor??ColorManager.cursorColor,
        keyboardType: textType ?? TextInputType.text,
        inputFormatters: inputFormatters,

        onFieldSubmitted: onFieldSubmitted,
        decoration:  InputDecoration(
          // floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText??'',

          errorMaxLines: errorMaxLines??1,
          errorStyle:errorTextStyle?? Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.errorColor,fontSize: FontSize.s10),
          labelText: labelText,
          labelStyle: labelStyle ?? Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorManager.gray300, fontSize: FontSize.s10),
          hintStyle: hintStyle ?? Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.hintTextColor, fontSize: FontSize.s20),
          fillColor: fillColorTextFiled ?? ColorManager.primaryGray,
          filled: filledColorTextFiled  ?? true,
          prefixIcon: prefixIconWidget,
          suffixIcon: suffixIconWidget,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color:enabledBorderColor??ColorManager.primaryGray, width: widthBorder??1),
            borderRadius: BorderRadius.circular(enabledBorderRadius??AppSize.s5),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(focusedBorderRadius??AppSize.s5),
              borderSide:  BorderSide(color: focusedBorderColor??ColorManager.primaryGray, width: widthBorder??AppSize.s1)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorManager.errorColor, width: AppSize.s1),
              borderRadius: BorderRadius.circular(errorBorderRadius??AppSize.s5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(focusedErrorBorderRadius??AppSize.s5),
              borderSide: const BorderSide(color: ColorManager.errorColor, width: AppSize.s1)
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p10, vertical: vertical??AppPadding.p12),
        ),
        onChanged: onChangedFunction,
        focusNode: focusNode,
        maxLines: maxLines??1,
        onEditingComplete: onEditingCompleteFunction,
        validator:validatorFunction,
        textInputAction: textInputAction,
        obscureText: obscure??false,


      ),
    );
  }
}
