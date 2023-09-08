import 'package:flutter/material.dart';

import 'widgets/otp_view_widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: OtpViewBody(),
    );
  }
}
