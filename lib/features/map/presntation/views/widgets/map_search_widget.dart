import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:father_delivery_user/features/map/data/search_data_model.dart';
import 'package:father_delivery_user/features/map/presntation/manager/map_cubit.dart';
import 'package:flutter/material.dart';

class MapSearchWidget extends StatefulWidget {
  const MapSearchWidget({super.key,required this.controller});
  final MapCubit controller;

  @override
  State<MapSearchWidget> createState() => _MapSearchWidgetState();
}

class _MapSearchWidgetState extends State<MapSearchWidget> {
  FocusNode textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textFieldFocusNode.addListener(() {setState(() {});});
  }

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: AppSize.s50,
          width:SizeConfig.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: ContainerManager.shadow,
            color: ColorManager.whiteColor,
          ),
          child: Row(
            children:  [
              InkWell(
                onTap: () async{
                  await widget.controller.getMyLocation(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  child: Icon(Icons.my_location,
                      color:textFieldFocusNode.hasFocus ?
                      ColorManager.blackColor: ColorManager.grayIcon
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical:  AppPadding.p8),
                child: VerticalDivider(width: AppSize.s1,
                    color: textFieldFocusNode.hasFocus ?
                    ColorManager.blackColor: ColorManager.grayIcon
                ),
              )
            ],
          ),
        ),
        Container(
            width: SizeConfig.screenWidth! - AppSize.s85,
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m2),
            child: CustomTextField(
              focusNode: textFieldFocusNode,
              enabledBorderRadius: AppSize.s0,
              widthBorder:AppSize.s0,
              isShadow: false,
              hintText: 'الرياض , المملكة العربية السعودية',
              fillColorTextFiled: ColorManager.whiteColor,
              hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
              inputTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.blackColor),
              onFieldSubmitted: (value) async{
                await widget.controller.getSearchData(value: value,context: context);
                if (context.mounted){
                  showSearchMenu(
                      context: context,
                      results:widget.controller.searchData!.results,
                      controller: widget.controller
                  );
                }
                },
            )
        ),
      ],
    );
  }
}

void showSearchMenu({BuildContext? context,List<Result>? results,MapCubit? controller}){
  showMenu(
      context: context!,
      position: const RelativeRect.fromLTRB(AppSize.s10, AppSize.s102, AppSize.s10, 0),
      color: ColorManager.whiteColor,
      surfaceTintColor: ColorManager.whiteColor,
      constraints: BoxConstraints(
        minWidth: SizeConfig.screenWidth! - AppSize.s20 ,
        maxWidth: SizeConfig.screenWidth!,
        maxHeight:  AppSize.s400,
        minHeight:  AppSize.s200,
      ),
      items: List.generate(results!.length, (index) {
        return  PopupMenuItem(
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  controller!.goToSearchLocation(results[index].lat.toDouble(), results[index].lng.toDouble());
                },
                child: Text(results[index].name,style: Theme.of(context).textTheme.displaySmall)
            )
        );
      }
      )
  );
}