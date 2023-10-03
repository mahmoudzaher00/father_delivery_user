import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/views/widgets/custom_edit_profile_bottom_navigation_bar.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: instance<EditProfileCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          appBarToolbarHeight: 50,
          titleContent: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'تعديل بياناتى',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
          ),
        ),
        body: const EditProfileViewBody(),
        bottomNavigationBar: const CustomEditProfileBottomNavigationBar(),
      ),
    );
  }
}

