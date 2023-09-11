import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_search_container.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantSearchWidget extends StatefulWidget {
  const RestaurantSearchWidget({super.key});

  @override
  State<RestaurantSearchWidget> createState() => _RestaurantSearchWidgetState();
}

class _RestaurantSearchWidgetState extends State<RestaurantSearchWidget> {
  @override
  void initState() {
    super.initState();
    instance<HomeCubit>().searchTextFieldFocusNode.addListener(instance<HomeCubit>().updateTextFieldStatus);
  }

  @override
  void dispose() {
    context.read<HomeCubit>().searchTextFieldFocusNode.dispose();
    //instance<HomeCubit>().searchTextFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSearchContainer(
      icon:Icons.search,
      containerColor: ColorManager.primaryGray,
      hasFocus: instance<HomeCubit>().searchTextFieldFocusNode.hasFocus,
      child: Container(
        width: SizeConfig.screenWidth! - AppSize.s90,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m2),
        child: CustomTextField(
          focusNode: instance<HomeCubit>().searchTextFieldFocusNode,
          enabledBorderRadius: AppSize.s0,
          widthBorder: AppSize.s0,
          isShadow: false,
          hintText: 'ابحث عن مطعمك المفضل',
          fillColorTextFiled: ColorManager.primaryGray,
          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
          inputTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.blackColor),
          onFieldSubmitted: (value) async {
            if(value.isNotEmpty){}
          },
        ),
      ),
    );
  }
}