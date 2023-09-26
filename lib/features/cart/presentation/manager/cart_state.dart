part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class IncrementProductCountState extends CartState {
  final int index;
  final int productCount;
  const IncrementProductCountState(this.index,this.productCount);
  @override
  List<Object> get props => [index,productCount];
}

class DecrementProductCountState extends CartState {
  final int index;
  final int productCount;
  const DecrementProductCountState(this.index,this.productCount);
  @override
  List<Object> get props => [index,productCount];
}

class RemoveProductState extends CartState {
  final int index;

  const RemoveProductState(this.index);
  @override
  List<Object> get props => [index];
}

class ChangeDeliveryStatusState extends CartState {
  final int value;

  const ChangeDeliveryStatusState(this.value);
  @override
  List<Object> get props => [value];
}

class ChangePaymentStatusState extends CartState {
  final int value;

  const ChangePaymentStatusState(this.value);
  @override
  List<Object> get props => [value];
}