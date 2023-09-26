import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/orders/presentation/views/orders_input_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit() : super(NewOrderInitial());
  Future<void> pikedCameraImages(context) async {
    const int numberOfImagesToCapture = 1; // Set the number of images to capture

    for (int i = 0; i < numberOfImagesToCapture; i++) {
      final pickedFile = await  instance<OrdersInputData>().picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        // Add the selected image to the list
        instance<OrdersInputData>().imageList.add(File(pickedFile.path));
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
      emit(PickedImageFromCamera(pickedFile!));
    }

  }

  Future<void> pikedGalleryImages(BuildContext context) async {
    final pickedFiles = await  instance<OrdersInputData>().picker.pickMultiImage(
      imageQuality: 50,
      maxHeight: 300,
      maxWidth: 400,
      // source: ImageSource.gallery,
    );

    if (pickedFiles.isNotEmpty) {
      final pickedImages = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      instance<OrdersInputData>().imageList.addAll(pickedImages);
      print(instance<OrdersInputData>().imageList);
    } else {
      if (kDebugMode) {
        print('No images selected.');
      }
    }
    emit(PickedImageFromGallery(pickedFiles));
  }

   void deleteImage(int index){
     instance<OrdersInputData>().imageList.removeAt(index);
     print('>>>>>>>>>>>>>>>>>>>>>>$index');
     emit(DeleteImageFromList(instance<OrdersInputData>().imageList.length));
   }


}
