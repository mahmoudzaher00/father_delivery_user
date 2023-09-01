import 'package:flutter/material.dart';



import 'custom_gradient_widget.dart';

class CustomNoInternetWidget extends StatefulWidget{
  const CustomNoInternetWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() { return CustomNoInternetWidgetState(); }
  
}
class CustomNoInternetWidgetState extends State<CustomNoInternetWidget>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            RadiantGradientMask(child: Icon(Icons.wifi_off_rounded,size: 150,)),
            SizedBox(height: 20,),
            // CustomText(
            //   text: AppStrings.details.tr(),
            //   fontWeight: FontWeight.w600,
            //   color: ColorManager.primaryOrange,
            // ),
          ],
        ),
      ),
    );
  }
  
}