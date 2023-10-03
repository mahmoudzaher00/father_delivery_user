import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/views/edit_profile_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/di.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/container_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class CustomEditProfileImage extends StatelessWidget {
  const CustomEditProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: (){
              instance<EditProfileInputData>().buildEditProfileImageAlertDialog(context);
            },
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                instance<EditProfileInputData>().selectedUserImage !=null?
                DecoratedBox(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: ContainerManager.shadow,
                      image:instance<EditProfileInputData>().userImageEmpty?const DecorationImage(
                          image: AssetImage(ImageAssets.profile,),fit: BoxFit.cover) :null
                  ),
                  child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.red,
                      backgroundImage: FileImage( instance<EditProfileInputData>().selectedUserImage!)
                  ),
                ):
                Container(
                  height: AppSize.s90,
                  width: AppSize.s90,
                  decoration:    BoxDecoration(
                    color: ColorManager.lightGray,
                    shape: BoxShape.circle,
                    boxShadow: ContainerManager.shadow,
                    image:instance<EditProfileInputData>().userImageEmpty?const DecorationImage(
                        image: AssetImage(ImageAssets.profile,),fit: BoxFit.cover) :null
                  ),
                  child:
                  // instance<RegisterCubit>().authInputData.technicalImageEmpty==true?null:
                    instance<EditProfileInputData>().userImageEmpty?null:
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
                  child: const Icon(Icons.edit,size: AppSize.s20,color: ColorManager.whiteColor,),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
