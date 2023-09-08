part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginPhoneInputFormatState extends LoginState {
  final String phoneFormat;

  const LoginPhoneInputFormatState(this.phoneFormat);
  @override
  List<Object> get props => [phoneFormat];

}
