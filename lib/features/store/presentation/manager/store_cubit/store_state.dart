part of 'store_cubit.dart';

abstract class StoreState extends Equatable {
  const StoreState();
  @override
  List<Object> get props => [];
}

class StoreInitial extends StoreState {
  @override
  List<Object> get props => [];
}
class ChangeFavouriteState extends StoreState {
  final int index;
  final bool value;

  const ChangeFavouriteState(this.index,this.value);
  @override
  List<Object> get props => [index,value];
}