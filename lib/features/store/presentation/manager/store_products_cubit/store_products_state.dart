
import 'package:equatable/equatable.dart';

abstract class StoreProductsState extends Equatable {
  const StoreProductsState();
  @override
  List<Object> get props => [];
}

class StoreProductsInitial extends StoreProductsState {
  @override
  List<Object> get props => [];
}

class ChangeProductTypeValueState extends StoreProductsState {
  final int index;
  const ChangeProductTypeValueState(this.index);
  @override
  List<Object> get props => [index];
}

class IncrementProductCountState extends StoreProductsState {
  final int index;
  final int productCount;
  const IncrementProductCountState(this.index,this.productCount);
  @override
  List<Object> get props => [index,productCount];
}

class DecrementProductCountState extends StoreProductsState {
  final int index;
  final int productCount;
  const DecrementProductCountState(this.index,this.productCount);
  @override
  List<Object> get props => [index,productCount];
}