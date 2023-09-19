import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'ingredients_bottom_sheet_state.dart';

class IngredientsBottomSheetCubit extends Cubit<IngredientsBottomSheetState> {
  IngredientsBottomSheetCubit() : super(IngredientsBottomSheetInitial());
  int numberOfMeals=1;

  void incrementNumberOfMeals(){
    numberOfMeals++;
    emit(IncrementNumberOfMealsState(valueCount: numberOfMeals));

  }
  void decrementNumberOfMeals(){
    if(numberOfMeals>1){
      numberOfMeals--;
      emit(DecrementNumberOfMealsState(valueCount: numberOfMeals));
    }



  }
  void updateCount(int id,int count){
    emit(UpdateCountValueState(id: id,valueCount: count));
  }


}
