import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: instance<HomeCubit>().sliderImages.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => instance<HomeCubit>().carouselController.animateToPage(entry.key),
          child: Container(
            width:HomeCubit.get(context).currentIndicatorIndex != entry.key ? AppSize.s5 : AppSize.s14,
            height: AppSize.s5,
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m12, horizontal: AppMargin.m2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: HomeCubit.get(context).currentIndicatorIndex != entry.key ?
                // color: instance<HomeCubit>().currentIndicatorIndex != entry.key ?
                ColorManager.gray200 : ColorManager.whiteColor
            ),
          ),
        );
      }).toList(),
    );
  },
);
  }
}