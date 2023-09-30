import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_container.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class StoreProductsSearchWidget extends StatefulWidget{
  const StoreProductsSearchWidget({super.key});

  @override
  State<StoreProductsSearchWidget> createState() => _StoreProductsSearchWidgetState();
}

class _StoreProductsSearchWidgetState extends State<StoreProductsSearchWidget> {

  final FocusNode focusNode = FocusNode();
  Color iconColor = Colors.grey; // Default color

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        iconColor = focusNode.hasFocus ? Colors.blue : Colors.grey;
      });
    });
  }

  @override
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
      child: Container(
        width: SizeConfig.screenWidth! - AppSize.s90,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m2),
        child: CustomTextField(
          focusNode: focusNode,
          enabledBorderRadius: AppSize.s0,
          widthBorder: AppSize.s0,
          isShadow: false,
          hintText: 'ابحث هنا',
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