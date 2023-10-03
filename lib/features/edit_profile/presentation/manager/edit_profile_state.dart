part of 'edit_profile_cubit.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();
  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}
class EditProfileImageFromCameraState extends EditProfileState {}
class EditProfileImageFromGalleryState extends EditProfileState {}
class DeleteProfileImageState extends EditProfileState {}
