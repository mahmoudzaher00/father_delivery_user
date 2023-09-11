import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../restaurants_view_widgets/carousel_slider_image_widget.dart';
import '../restaurants_view_widgets/restaurant_list_view_widget.dart';
import '../restaurants_view_widgets/restaurant_search_widget.dart';


class RestaurantTabBarView extends StatelessWidget{
  const RestaurantTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: AppPadding.p18,bottom:AppPadding.p2),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                RestaurantSearchWidget(),
                SizedBox(height:AppSize.s16),
                CarouselSliderImageWidget(),
                SizedBox(height:AppSize.s10),
                RestaurantListViewWidget(),
              ],
            ),
          ),
        );
       },
    );
  }
}











