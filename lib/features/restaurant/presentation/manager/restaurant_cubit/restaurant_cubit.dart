import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:father_delivery_user/core/resources/assets_manager.dart';

import '../../../data/models/restaurant_model.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());
  int selectedIndexOfPageView=0;
  final List<MealDataModel> list  =[
    MealDataModel(ImageAssets.r1, 'عروضنا'),
    MealDataModel(ImageAssets.r2, 'بروست'),
    MealDataModel(ImageAssets.r3, 'سندوتش'),
    MealDataModel(ImageAssets.r4, 'برجر'),
    MealDataModel(ImageAssets.r5, 'مسحب'),

  ];
  // int? swapIndexOfTabBar(int index){
  //   selectedIndexOfTabBar=index;
  //   emit(IndexOfTapBarState(index));
  //   return index;
  // }

  void pageViewSwapIndex(index){
    selectedIndexOfPageView=index;

    emit(IndexOfTapBarState(index));
  }
}
