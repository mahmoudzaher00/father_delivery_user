import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/internet_handling/internet_handling_cubit.dart';
import 'custom_no_internet_widget.dart';

class WrapperInternet extends StatefulWidget {
  final Widget child;
  const WrapperInternet({required this.child,Key? key}) : super(key: key);

  @override
  State<WrapperInternet> createState() => _WrapperInternetState();
}

class _WrapperInternetState extends State<WrapperInternet> {
  @override
  initState(){
    super.initState();
    InternetHandlingCubit.get(context).checkConnectivity();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetHandlingCubit, InternetHandlingState>(
      listener: (context, state) {
      if(state is InternetHandlingNoInternetState){
        InternetHandlingCubit.get(context).isConnected=false;
        if (kDebugMode) {
          print("no internet");
          print(InternetHandlingCubit.get(context).isConnected);
        }
        // SnackBarMessage.showInternetConnectionSnackBar(context,LocaleKeys.noInternet.tr(),Icons.wifi_off_sharp);
        // show your widget
      }else if (state is InternetHandlingInternetRestoresState){
        // SnackBarMessage.showInternetConnectionSnackBar(context,LocaleKeys.restoreInternet.tr(),Icons.wifi);
        InternetHandlingCubit.get(context).isConnected=true;
        if (kDebugMode) {
          print("internet restored");
          print(InternetHandlingCubit.get(context).isConnected);
        }
        // you should pop your error widget
      }
    },
      builder: (context, state) {
        return   InternetHandlingCubit.get(context).isConnected?widget.child:const CustomNoInternetWidget();

  },
);
  }
}
