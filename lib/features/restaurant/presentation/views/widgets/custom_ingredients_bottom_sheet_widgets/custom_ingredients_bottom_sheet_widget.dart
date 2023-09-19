import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../data/models/ingredients_model.dart';
import '../../../manager/ingredients_bottom_sheet_cubit/ingredients_bottom_sheet_cubit.dart';
import 'custom_ingredient_counter_widget.dart';

class CustomIngredientsBottomSheet extends StatefulWidget {
  final IngredientsData model;
  const CustomIngredientsBottomSheet({Key? key, required this.model}) : super(key: key);
  @override
  State<CustomIngredientsBottomSheet> createState() => _CustomIngredientsBottomSheetState();
}

class _CustomIngredientsBottomSheetState extends State<CustomIngredientsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientsBottomSheetCubit, IngredientsBottomSheetState>(
      builder: (context, state) {
        return SizedBox(
          height: SizeConfig.screenHeight! * .76,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: buildListView(context),
            bottomNavigationBar: _buildBottomNavigationBar(context),
          ),
          );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text('إضافات خاصة بالوجبة',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,)
      ),
      centerTitle: true,
      bottom: const PreferredSize(preferredSize: Size.fromHeight(2), child:  Divider(),
      ),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(widget.model.list.length, (index) {
          return Column(
            children: [
              CustomIngredientCounterWidget(model: widget.model.list[index],),
            ],
          );
          },
        ),
        if(widget.model.flavors.isNotEmpty)
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الإضافات',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,)
                ),
                Text(widget.model.flavors,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 11.sp,)
                ),
              ],
            ),
          ),
        if(widget.model.flavors.isNotEmpty)
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('قيمة الإضافات',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,)
                ),
                Text('${widget.model.flavorsPricing} رس ',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14.sp,)
                ),
              ],
            ),
          ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('قيمة الوجبة',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,)
              ),
              Text('${instance<IngredientsBottomSheetCubit>().numberOfMeals}X ${widget.model.mealPrice.toStringAsFixed(2)} رس',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14.sp,)
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الإجمالى',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,)
              ),
              Text(
                  '${((widget.model.mealPrice + widget.model.flavorsPricing) * instance<IngredientsBottomSheetCubit>().numberOfMeals).toStringAsFixed(2) } رس ',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,color: ColorManager.primaryOrange)
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
          child:  CustomTextField(
            isShadow: false,
            hintText: 'أضف ملاحظاتك (إن وجدت)',
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 11.sp,color: ColorManager.borderColor),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8.0.sp,horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButtonWidget(
              buttonBackgroundColor: ColorManager.primaryOrange,
              width: SizeConfig.screenWidth!*.4,
              child: Text('اطلب',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.whiteColor)
              ),),
            CustomElevatedButtonWidget(
                buttonIsGradient: false,
                buttonBackgroundColor: ColorManager.whiteColor,
                buttonBorderColor: ColorManager.primaryOrange,width: SizeConfig.screenWidth!*.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed:()=>instance<IngredientsBottomSheetCubit>().incrementNumberOfMeals(),
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        visualDensity:const VisualDensity(vertical: -4,horizontal: -4),
                        tooltip: 'اضافة',
                        color: ColorManager.primaryOrange,
                        icon: const Icon(Icons.add_circle_outline)),
                    Text('${instance<IngredientsBottomSheetCubit>().numberOfMeals}',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,color: ColorManager.primaryOrange)
                    ),
                    IconButton(onPressed:()=>instance<IngredientsBottomSheetCubit>().decrementNumberOfMeals(),
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        tooltip: 'انقاص',
                        visualDensity:const VisualDensity(vertical: -4,horizontal: -4),
                        color: ColorManager.primaryOrange,
                        icon: const Icon(Icons.remove_circle_outline)),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
