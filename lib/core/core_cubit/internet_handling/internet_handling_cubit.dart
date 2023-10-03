import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/network_info.dart';


part 'internet_handling_state.dart';

class InternetHandlingCubit extends Cubit<InternetHandlingState> {
  InternetHandlingCubit() : super(InternetHandlingInitial());
  static InternetHandlingCubit get(context)=>BlocProvider.of(context);
  bool error = false;
  bool isConnected=true;
  void checkConnectivity(){
    ConnectivityService.listen((isConnected) {
      if(isConnected){
        if(error){
          emit(InternetHandlingInternetRestoresState());
          error = false;
        }
      }else{
        error = true;
        emit(InternetHandlingNoInternetState());
      }
    });
  }
}
