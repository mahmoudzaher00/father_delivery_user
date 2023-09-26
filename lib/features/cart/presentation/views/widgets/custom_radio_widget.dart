import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class CustomRadioWidget extends StatelessWidget {
  final String title;
  final String? description;
  final int radioValue;
  final int? radioGroupValue;
  final ValueChanged<int?>? onChange;
  final VoidCallback? onTap;
  final Widget? child;

  const CustomRadioWidget({
  super.key,
  this.description,
  this.onChange,
  this.child,
  this.radioGroupValue,
  required this.title,
  required this.radioValue,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: radioValue == radioGroupValue ?ColorManager.blackColor: ColorManager.gray700,
              fontWeight: FontWeight.bold)
          ),
          const SizedBox(width: AppSize.s10),
          Text(description??'',style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: ColorManager.gray700)
          ),
          const Spacer(),
          child?? const SizedBox.shrink(),
          Radio(
              value:radioValue,
              activeColor:ColorManager.primaryOrange,
              groupValue: radioGroupValue,
              onChanged: onChange
          ),
        ],
      ),
    );
  }
}