part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {

}
class RegisterPhoneInputFormatState extends RegisterState {
  final String phoneFormat;

  const RegisterPhoneInputFormatState(this.phoneFormat);
  @override
  List<Object> get props => [phoneFormat];

}
class SetTechnicalImageFromCameraState extends RegisterState {}
class SetTechnicalImageFromGalleryState extends RegisterState {}
class DeleteTechnicalImageState extends RegisterState {}