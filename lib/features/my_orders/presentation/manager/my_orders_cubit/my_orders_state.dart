import 'package:equatable/equatable.dart';

abstract class MyOrdersState  extends Equatable{
  const MyOrdersState();
  @override
  List<Object> get props => [];
}

class  MyOrdersInitial extends MyOrdersState {
}

class ChangeLangState extends MyOrdersState {
  final String lang;
  const ChangeLangState(this.lang);
  @override
  List<Object> get props => [lang];
}

class ChangeIndicatorState extends MyOrdersState {
  final int index;
  const ChangeIndicatorState(this.index);
  @override
  List<Object> get props => [index];
}

class UpdateTextFieldStatus extends MyOrdersState {
  final bool hasFocus;

  const UpdateTextFieldStatus(this.hasFocus);
  @override
  List<Object> get props => [hasFocus];
}

class ChangeFavouriteState extends MyOrdersState {
  final int index;
  final bool value;

  const ChangeFavouriteState(this.index,this.value);
  @override
  List<Object> get props => [index,value];
}