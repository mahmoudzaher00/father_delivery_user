import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of(context);

  List<bool> favouriteList = List.generate(10, (index) => false);

  void changeFavouriteIconStatus(int index) {
    favouriteList[index] = !favouriteList[index];
    emit(ChangeFavouriteState(index, favouriteList[index]));
  }


}