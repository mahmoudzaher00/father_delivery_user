import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/core_cubit/map_cubit/map_cubit.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:father_delivery_user/features/user_locations/presentation/views/user_locations_input_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomMapSearchWidget extends StatefulWidget {
  const CustomMapSearchWidget({super.key});

  @override
  State<CustomMapSearchWidget> createState() => _CustomMapSearchWidgetState();
}

class _CustomMapSearchWidgetState extends State<CustomMapSearchWidget> {

  @override
  void initState() {
    super.initState();
    instance<MapCubit>().textFieldFocusNode.addListener(instance<MapCubit>().updateTextFieldStatus);
  }

  @override
  void dispose() {
    instance<MapCubit>().textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Container(
              height: AppSize.s50,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: ContainerManager.shadow,
                color: ColorManager.whiteColor,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: ()=> instance<MapCubit>().getMyLocation(context),
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      icon: Icon(
                          Icons.my_location,
                          color: instance<MapCubit>().textFieldFocusNode.hasFocus ? ColorManager.blackColor : ColorManager.grayIcon
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: VerticalDivider(
                        width: AppSize.s1,
                        color: instance<MapCubit>().textFieldFocusNode.hasFocus ? ColorManager.blackColor : ColorManager.grayIcon),
                  )
                ],
              ),
            ),
            Container(
                width: SizeConfig.screenWidth! - AppSize.s85,
                margin: const EdgeInsets.symmetric(horizontal: AppMargin.m2),
                child: CustomTextField(
                  focusNode: instance<MapCubit>().textFieldFocusNode,
                  enabledBorderRadius: AppSize.s0,
                  widthBorder: AppSize.s0,
                  isShadow: false,
                  hintText: 'الرياض , المملكة العربية السعودية',
                  fillColorTextFiled: ColorManager.whiteColor,
                  hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
                  inputTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.blackColor),
                  suffixIconWidget: instance<MapCubit>().state is FetchSearchDataLoadingState?
                  const CupertinoActivityIndicator():const SizedBox.shrink(),
                  onFieldSubmitted: (value) async {
                    if(value.isNotEmpty){
                      await instance<MapCubit>().fetchSearchData(value);
                    }
                    if (context.mounted) {
                        instance<UserLocationsInputData>().showSearchMenu(
                          context: context,
                          results:instance<MapCubit>().searchData!.results,

                      );
                      }

                  },
               )),
          ],
        );
      },
    );
  }
}


