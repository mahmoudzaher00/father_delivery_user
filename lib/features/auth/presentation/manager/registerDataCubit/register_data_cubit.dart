import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/app/di.dart';
import '../../views/auth_input_data.dart';

part 'register_data_state.dart';

class RegisterDataCubit extends Cubit<RegisterDataState> {
  RegisterDataCubit() : super(RegisterDataInitial());


  void deleteTechnicalImage(){
    instance<AuthInputData>().userImageEmpty = false;
    instance<AuthInputData>().selectedUserImage=null;
    emit(DeleteTechnicalImageState());
  }
  //UI Functions
  Future<void> openCamera(context) async {
    final pickedFile = await instance<AuthInputData>().picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.camera);
    if (pickedFile != null) {
      instance<AuthInputData>().selectedUserImage = File(pickedFile.path);
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
    emit(SetUserImageFromCameraState());
  }

  Future<void> openGallery(context) async {
    final pickedFile = await instance<AuthInputData>().picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.gallery);

    if (pickedFile != null) {

      instance<AuthInputData>().selectedUserImage = File(pickedFile.path);
      print( instance<AuthInputData>().selectedUserImage);

    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
    emit(SetUserImageFromGalleryState());
  }
}
