import 'package:father_delivery_user/core/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../auth_input_data.dart';

class CustomLoginPhoneTextField extends StatelessWidget {
  const CustomLoginPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              controller: instance<AuthInputData>().loginPhoneController,
              width: SizeConfig.screenWidth! * .6,
              hintText: '508  xxx  xxx',
              textType: TextInputType.phone,
              inputFormatters: [
                // LengthLimitingTextInputFormatter(20),
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              validatorFunction: instance<AuthInputData>().loginPhoneValidator,
            ),
            Container(
                height: 50,
                width: SizeConfig.screenWidth! * .3,

                decoration: BoxDecoration(
                    color: ColorManager.primaryGray,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: ContainerManager.shadow),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('966+',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20),
                      ),
                      SvgPicture.asset(SvgAssets.saudiFlag,
                      ),
                    ]))
          ],
        ));
  }
}