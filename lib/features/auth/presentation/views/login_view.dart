import 'package:father_delivery_user/core/app/constants.dart';
import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import 'widgets/login_view_widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}