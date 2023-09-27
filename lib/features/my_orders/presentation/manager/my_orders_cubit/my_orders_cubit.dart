import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_orders_state.dart';

class MyOrdersCubit extends Cubit< MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersInitial());
  static MyOrdersCubit get(context)=>BlocProvider.of(context);


  TabController? tabController;



}