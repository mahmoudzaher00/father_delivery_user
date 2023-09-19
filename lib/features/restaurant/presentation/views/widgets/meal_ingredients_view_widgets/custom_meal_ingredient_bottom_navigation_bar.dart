import 'package:father_delivery_user/features/restaurant/presentation/views/widgets/custom_ingredients_bottom_sheet_widgets/custom_ingredients_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../../data/models/ingredients_model.dart';

class CustomMealIngredientBottomNavigationBar extends StatefulWidget {
  const CustomMealIngredientBottomNavigationBar({super.key,});

  @override
  State<CustomMealIngredientBottomNavigationBar> createState() => _CustomMealIngredientBottomNavigationBarState();
}

class _CustomMealIngredientBottomNavigationBarState extends State<CustomMealIngredientBottomNavigationBar> {
  IngredientsData model=IngredientsData(list: [
    IngredientsModel(name: 'إضافة بطاطس',price: '2.00', id: 0,),
    IngredientsModel(name: 'إضافة تومية حارة',price: '2.00', id: 1,),
    IngredientsModel(name: 'إضافة تومية باردة',price: '3.00', id: 2,),
    IngredientsModel(name: 'إضافة خبز',price: '1.00', id: 3,),
  ],mealPrice: 30.00);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      height: 50,
      child: CustomElevatedButtonWidget(
        onPressed: (){
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
              context: context,
              backgroundColor: ColorManager.whiteColor,
              isScrollControlled: true,
              useRootNavigator: true,
              elevation: 4,
              builder: (context) => Padding(
                padding:MediaQuery.of(context).viewInsets,
                child: CustomIngredientsBottomSheet(
                  model:model,
                ),
          ));

        },
          child: Text('اطلب',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,color: ColorManager.whiteColor),)),
    );
  }
}