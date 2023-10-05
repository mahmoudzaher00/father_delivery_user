import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/core_cubit/map_cubit/map_cubit.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_search_container.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:father_delivery_user/features/user_locations/presentation/views/user_locations_input_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomMapSearchWidget extends StatefulWidget {
  const CustomMapSearchWidget({super.key});

  @override
  State<CustomMapSearchWidget> createState() => _CustomMapSearchWidgetState();
}

class _CustomMapSearchWidgetState extends State<CustomMapSearchWidget> {
  List<String> empty=[
    'لا يوجد نتائج مطابقة'
  ];
  bool isFocused = false;
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    // instance<MapCubit>().textFieldFocusNode.addListener(instance<MapCubit>().updateTextFieldStatus);
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // instance<MapCubit>().textFieldFocusNode.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return CustomSearchContainer(
          icon:Icons.my_location,
          containerColor: ColorManager.whiteColor,
          // hasFocus: instance<MapCubit>().textFieldFocusNode.hasFocus,
          hasFocus: _focusNode.hasFocus,
          onTap: ()=> instance<MapCubit>().getMyLocation(context),
          margin:AppMargin.m0,
          child: Container(
              width: SizeConfig.screenWidth! - AppSize.s85,
              margin: const EdgeInsets.symmetric(horizontal: AppMargin.m2),
              child: CustomTextField(
                // focusNode: instance<MapCubit>().textFieldFocusNode,
                focusNode: _focusNode,

                enabledBorderRadius: AppSize.s0,
                widthBorder: AppSize.s0,
                isShadow: false,
                hintText: 'الرياض , المملكة العربية السعودية',
                fillColorTextFiled: ColorManager.whiteColor,
                hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
                inputTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.blackColor,fontSize: 16.sp),
                suffixIconWidget: instance<MapCubit>().searchLoader ?
                const CupertinoActivityIndicator():const SizedBox.shrink(),
                onFieldSubmitted: (value) async {
                  if(value.isNotEmpty){
                    await instance<MapCubit>().fetchSearchData(value);
                    print('asdasd${instance<MapCubit>().searchData!.results.length}');
                    if (context.mounted) {

                      instance<UserLocationsInputData>().showSearchMenu(
                        context: context,
                        results:instance<MapCubit>().searchData!.results,
                      );
                    }
                  }
                  },
              )
          ),
        );
       },
    );
  }
}


