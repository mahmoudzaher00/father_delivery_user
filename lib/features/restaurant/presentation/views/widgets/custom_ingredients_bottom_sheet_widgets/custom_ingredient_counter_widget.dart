import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../data/models/ingredients_model.dart';
import '../../../manager/ingredients_bottom_sheet_cubit/ingredients_bottom_sheet_cubit.dart';


class CustomIngredientCounterWidget extends StatelessWidget  {
  final IngredientsModel model;
  const CustomIngredientCounterWidget({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientsBottomSheetCubit, IngredientsBottomSheetState>(
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(model.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                  )
              ),
              const SizedBox(width: 5,),
              Text(
                  '( ${model.price} رس )',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 11.sp,
                      color: ColorManager.hintTextColor
                  )
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.zero,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color:model.count==0?
                    ColorManager.lightGray1:ColorManager.primaryOrange
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      model.increment();
                      instance<IngredientsBottomSheetCubit>().updateCount(model.id,model.count);},
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        visualDensity:const VisualDensity(vertical: -4,horizontal: -4),
                        tooltip: 'اضافة',
                        color: ColorManager.whiteColor,
                        icon: const Icon(Icons.add_circle_outline)
                    ),
                    const SizedBox(width: 12,),
                    Text(
                        model.count.toString(),
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 14.sp,
                            color: ColorManager.whiteColor
                        )
                    ),
                    const SizedBox(width: 12,),
                    IconButton(onPressed: (){
                      model.decrement();
                      instance<IngredientsBottomSheetCubit>().updateCount(model.id,model.count);},
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        tooltip: 'انقاص',
                        visualDensity:const VisualDensity(vertical: -4,horizontal: -4),
                        color: ColorManager.whiteColor,
                        icon: const Icon(Icons.remove_circle_outline)
                    ),
                  ],
                ),
              )

            ],
          ),
        );},
    );
  }
}