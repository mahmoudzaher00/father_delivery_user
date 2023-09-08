import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/elavated_button.dart';

import 'package:flutter/material.dart';

import '../user_locations_input_data.dart';
import 'custom_services_widget.dart';

class CustomSetLocationAndServiceButton extends StatelessWidget {
  const CustomSetLocationAndServiceButton({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(8.0),
      child: MyElevatedButton(
        width: SizeConfig.screenWidth,
        height: 50,

        borderRadius: BorderRadius.circular(AppSize.s8),
        onPressed: () {
          selectServicesDialog(context);
        },
        child: Text(
            "أكد مكانك واختار الخدمة",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.whiteColor)
        ),
      ),
    );
  }
}

selectServicesDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Colors.white.withOpacity(0),
          insetPadding: const EdgeInsets.only(bottom: AppPadding.p0,left: AppPadding.p0,right: AppPadding.p0),
          child: Container(
              height: AppSize.s290,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(AppPadding.p18),
              color: ColorManager.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('اختر خدمة للبدء',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: AppSize.s20),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: instance<UserLocationsInputData>().servicesList.length,
                      itemBuilder: (context,i){
                        return ServicesWidget(index: i);
                        },
                    separatorBuilder: (BuildContext context, int index) {
                        return const Divider(  color: ColorManager.gray100);
                        },
                 )
              ],
            )
          )
      );
    },
  );
}

