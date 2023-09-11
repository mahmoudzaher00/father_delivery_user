import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:father_delivery_user/features/restaurant/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRestaurantTabBar extends StatelessWidget {
  const CustomRestaurantTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return TabBar(
            controller: instance<RestaurantCubit>().tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: List.generate(instance<RestaurantCubit>().restaurantTabBarList.length, (index) {
              return Column(
                children: [
                  ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: ColorManager.whiteColor,
                          padding: const EdgeInsets.all(6),
                          shape: CircleBorder(
                            side: BorderSide(
                                color: instance<RestaurantCubit>().selectedIndexOfTabBar == index ?
                                ColorManager.primaryOrange : ColorManager.lightGray1
                            ),
                          )
                      ),
                      child: Row(
                        children: [
                          CustomImage(
                            instance<RestaurantCubit>().restaurantTabBarList[index].mealImage,
                            height: 40,
                            width: 40,
                            isShadow: false,
                            isNetwork: false,
                            fit: BoxFit.cover,
                          ),
                        ],
                      )),
                  Text(
                    instance<RestaurantCubit>().restaurantTabBarList[index].mealName,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color:
                            instance<RestaurantCubit>().selectedIndexOfTabBar == index ?
                            ColorManager.primaryBlack : ColorManager.hintTextColor,
                        fontSize: 14.sp),
                  )
                ],
              );
            }));
      },
    );
  }
}
