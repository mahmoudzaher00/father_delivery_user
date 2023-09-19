part of 'ingredients_bottom_sheet_cubit.dart';

abstract class IngredientsBottomSheetState extends Equatable {
  const IngredientsBottomSheetState();
  @override
  List<Object> get props => [];
}

class IngredientsBottomSheetInitial extends IngredientsBottomSheetState {}

class UpdateCountValueState extends IngredientsBottomSheetState {
  final int id;
  final int valueCount;
  const UpdateCountValueState({this.id=0, this.valueCount=0});
  @override
  List<Object> get props => [id,valueCount];
}

class IncrementNumberOfMealsState extends IngredientsBottomSheetState {
  final int valueCount;
  const IncrementNumberOfMealsState({this.valueCount=1});
  @override
  List<Object> get props => [valueCount];
}

class DecrementNumberOfMealsState extends IngredientsBottomSheetState {
  final int valueCount;
  const DecrementNumberOfMealsState({this.valueCount=1});
  @override
  List<Object> get props => [valueCount];
}

