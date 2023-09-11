import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/features/auth/presentation/views/auth_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../manager/registerDataCubit/register_data_cubit.dart';
import '../../../manager/register_cubit/register_cubit.dart';

class CustomRegisterDataImageWidget extends StatelessWidget {
  const CustomRegisterDataImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterDataCubit, RegisterDataState>(
      builder: (context, state) {
        print(state);
        return Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: (){
              instance<AuthInputData>().buildSetProfileImageAlertDialog(context);
            },
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                instance<AuthInputData>().selectedUserImage !=null?
                  CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red,
                      backgroundImage: FileImage( instance<AuthInputData>().selectedUserImage!)
                  ):
                  Container(
                    height: AppSize.s90,
                    width: AppSize.s90,
                    decoration:    BoxDecoration(
                      color: ColorManager.lightGray,
                      shape: BoxShape.circle,
                      boxShadow: ContainerManager.shadow
                    ),
                    child:
                    // instance<RegisterCubit>().authInputData.technicalImageEmpty==true?null:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                       Icon(Icons.person,size: 59,color: ColorManager.gray500,)
                      ],
                    ),
                  ),

                Container(
                  alignment: Alignment.center,
                  height: AppSize.s28,
                  width: AppSize.s28,
                  decoration: const BoxDecoration(
                      color: ColorManager.primaryOrange,
                      shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add,size: AppSize.s20,color: ColorManager.whiteColor,),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
