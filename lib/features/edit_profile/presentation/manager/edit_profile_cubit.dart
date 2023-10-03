import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/views/edit_profile_input_data.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app/di.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  //UI Functions
  void deleteProfileImage(){
    instance<EditProfileInputData>().userImageEmpty = false;
    instance<EditProfileInputData>().selectedUserImage=null;
    emit(DeleteProfileImageState());
  }
  Future<void> openCamera(context) async {
    final pickedFile = await instance<EditProfileInputData>().picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.camera);
    if (pickedFile != null) {
      instance<EditProfileInputData>().selectedUserImage = File(pickedFile.path);
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
    emit(EditProfileImageFromCameraState());
  }

  Future<void> openGallery(context) async {
    final pickedFile = await instance<EditProfileInputData>().picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.gallery);

    if (pickedFile != null) {

      instance<EditProfileInputData>().selectedUserImage = File(pickedFile.path);

    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
    emit(EditProfileImageFromGalleryState());
  }
}
