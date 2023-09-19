import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class RestaurantMapButton extends StatelessWidget {
  const RestaurantMapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient:  const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              tileMode: TileMode.decal,
              colors: [Color(0xffEF554A), Color(0xffFF8C69)])
      ),
      child: ElevatedButton(
          onPressed: (){
            //Navigator.pushNamed(context, Routes.activeAccountRoute);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: ColorManager.lightOrange,
              padding: EdgeInsets.zero
          ),
          child:  Text('اطلب',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.whiteColor)
          )
      ),
    );
  }
}
