part of 'register_data_cubit.dart';

abstract class RegisterDataState extends Equatable {
  const RegisterDataState();
  @override
  List<Object> get props => [];
}

class RegisterDataInitial extends RegisterDataState {

}
class SetUserImageFromCameraState extends RegisterDataState {}
class SetUserImageFromGalleryState extends RegisterDataState {}
class DeleteTechnicalImageState extends RegisterDataState {}