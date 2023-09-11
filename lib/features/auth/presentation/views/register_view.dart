import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/register_view_widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<RegisterCubit>(),
      child: const Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
