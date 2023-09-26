import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/features/home/data/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';

import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  FocusNode searchTextFieldFocusNode = FocusNode();
  final CarouselController carouselController = CarouselController();
  TabController? tabController;
  String currentLang = "en";
  int currentIndicatorIndex = 0;
  List<LanguageModel> lang = [
    LanguageModel(title: "عربي",value: "ar"),
    LanguageModel(title: "English",value: "en"),
 ];

  List<bool> favouriteList = List.generate(10, (index) => false);

  List<String> sliderImages = [
    ImageAssets.imageSlider,
    ImageAssets.imageSlider,
    ImageAssets.imageSlider,
    ImageAssets.imageSlider,
    ImageAssets.imageSlider,
    ImageAssets.imageSlider,
  ];


  void changeLang(String lang){
    currentLang = lang;
    emit(ChangeLangState(lang));
  }

  void changeFavouriteIconStatus(int index) {
    favouriteList[index] = !favouriteList[index];
    emit(ChangeFavouriteState(index, favouriteList[index]));
  }

  void updateTextFieldStatus(){
    emit(UpdateTextFieldStatus(searchTextFieldFocusNode.hasFocus));
  }

  void changeIndicator(int value) {
    currentIndicatorIndex = value;
    emit(ChangeIndicatorState(value));
  }

}