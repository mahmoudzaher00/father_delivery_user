import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/routes_manager.dart';
import 'package:father_delivery_user/features/user_locations/presentation/views/user_locations_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/values_manager.dart';

class ServicesWidget extends StatelessWidget {
  final int index;
  const ServicesWidget({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:AppPadding.p8,vertical: AppPadding.p4),
        child: Row(
          children: [
            Container(
              width: AppSize.s50,
              height: AppSize.s50,
              padding: const EdgeInsets.all(AppPadding.p10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.gray100
              ),
              child: SvgPicture.asset(instance<UserLocationsInputData>().servicesList[index].image!),
            ),
            const SizedBox(width: AppSize.s40),
            Text(
              instance<UserLocationsInputData>().servicesList[index].title!,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}