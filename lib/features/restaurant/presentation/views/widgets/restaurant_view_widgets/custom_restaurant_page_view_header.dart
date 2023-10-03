import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:father_delivery_user/features/restaurant/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRestaurantPageViewHeader extends StatelessWidget {
  final PageController pageController;

  const CustomRestaurantPageViewHeader({super.key, required this.pageController,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return SizedBox(
          height: 94,
          width: SizeConfig.screenWidth!,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: instance<RestaurantCubit>().list.length,
            separatorBuilder: (BuildContext context, int index) =>Padding(padding: EdgeInsetsDirectional.only(end: 1.w)),
            itemBuilder:  (context, index) {
            return ElevatedButton(
              onPressed: (){
                pageController.jumpToPage(index, );
                // pageController.animateToPage(index, duration: const Duration(milliseconds: 250), curve: Curves.ease);
                instance<RestaurantCubit>().pageViewSwapIndex(index);
              },
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: ColorManager.whiteColor,
                  backgroundColor: ColorManager.transparentColor,
                  surfaceTintColor: ColorManager.transparentColor,
                  shadowColor: ColorManager.transparentColor,
                  foregroundColor: ColorManager.extraLightOrange,
                  padding: const EdgeInsets.all(12),
                  shape: const CircleBorder()
              ),
              child: Column(
                children: [
                  CustomImage(
                    image:instance<RestaurantCubit>().list[index].mealImage,
                    isShadow: false,
                    isNetwork: false,
                    fit: BoxFit.fill,
                    isCircular: true,
                    isAsset: true,
                    radiusCircleAvatar: 25,
                    circleBorderColor: instance<RestaurantCubit>().selectedIndexOfPageView == index ?
                    ColorManager.primaryOrange : ColorManager.lightGray1,
                  ),
                        Text(
                          instance<RestaurantCubit>().list[index].mealName,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color:
                                  instance<RestaurantCubit>().selectedIndexOfPageView == index ?
                                  ColorManager.primaryBlack : ColorManager.hintTextColor,
                              fontSize: 14.sp),
                        )
                      ],
                    ),
            );
          },),
        );
      },
    );
  }
}
