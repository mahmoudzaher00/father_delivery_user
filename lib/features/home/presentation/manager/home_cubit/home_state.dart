import 'package:equatable/equatable.dart';

abstract class HomeState  extends Equatable{
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
}

class ChangeLangState extends HomeState {
  final String lang;
  const ChangeLangState(this.lang);
  @override
  List<Object> get props => [lang];
}

class ChangeIndicatorState extends HomeState {
  final int index;
  const ChangeIndicatorState(this.index);
  @override
  List<Object> get props => [index];
}

class UpdateTextFieldStatus extends HomeState {
  final bool hasFocus;

  const UpdateTextFieldStatus(this.hasFocus);
  @override
  List<Object> get props => [hasFocus];
}