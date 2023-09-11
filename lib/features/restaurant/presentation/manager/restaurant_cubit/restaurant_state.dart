part of 'restaurant_cubit.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class IndexOfTapBarState extends RestaurantState {
  final int index;
  const IndexOfTapBarState(this.index);
  @override
  List<Object> get props => [index];
}
class Testt extends RestaurantState {
  final int index;
  final int index1;
  const Testt(this.index, this.index1);
  @override
  List<Object> get props => [index,index1];
}
