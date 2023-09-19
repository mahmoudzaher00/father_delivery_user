import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_search_container.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantSearchWidget extends StatefulWidget{
  const RestaurantSearchWidget({super.key});

  @override
  State<RestaurantSearchWidget> createState() => _RestaurantSearchWidgetState();
}

class _RestaurantSearchWidgetState extends State<RestaurantSearchWidget> {

  final FocusNode focusNode = FocusNode();
  Color _iconColor = Colors.grey; // Default color

  @override
  void initState() {
    super.initState();

    // Add a listener to the FocusNode to update the icon color
    focusNode.addListener(() {
      setState(() {
        _iconColor = focusNode.hasFocus ? Colors.blue : Colors.grey;
      });
    });
  }
  void dispose() {
    // Dispose of the FocusNode to avoid memory leaks
    focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomSearchContainer(
      icon:Icons.search,
      containerColor: ColorManager.primaryGray,
      hasFocus:focusNode.hasFocus,
      // hasFocus: context.read<HomeCubit>().searchTextFieldFocusNode.hasFocus,
      // hasFocus: context.read<HomeCubit>().searchTextFieldFocusNode.hasFocus,
      child: Container(
        width: SizeConfig.screenWidth! - AppSize.s90,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m2),
        child: CustomTextField(
          focusNode: focusNode,
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

    // return CustomTextField(
    //   focusNode: focusNode,
    //   enabledBorderRadius: AppSize.s0,
    //   widthBorder: AppSize.s0,
    //   prefixIconWidget: SizedBox(
    //     width: 70,
    //     child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //         IconButton(
    //         onPressed: (){},
    //         padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
    //         icon: Icon(Icons.add,
    //             color: _iconColor
    //         )
    //     ),
    //       SizedBox(
    //         height: 30,
    //         width: 1,
    //         child: VerticalDivider(
    //             width: AppSize.s1,
    //             thickness: 1,
    //             color: _iconColor
    //         ),
    //       )]
    //     ),
    //   ),
    //   isShadow: false,
    //   hintText: 'ابحث عن مطعمك المفضل',
    //   fillColorTextFiled: ColorManager.primaryGray,
    //   hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
    //   // inputTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.blackColor),
    //   onFieldSubmitted: (value) async {
    //     if(value.isNotEmpty){}},
    // );
  }

}