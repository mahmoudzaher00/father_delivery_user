import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app/di.dart';
import '../../views/auth_input_data.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  AuthInputData authInputData=AuthInputData();
  void formatInput() {
    if (instance<AuthInputData>().registerPhoneController.text.isEmpty) {
      return;
    }
    String textInput = instance<AuthInputData>().registerPhoneController.text.replaceAll(RegExp(r'\s+'), '');

    if (textInput.length > 10) {
      textInput = textInput.substring(0, 10); // Limit to 10 characters
    }
    String formattedText = '';
    for (int i = 0; i < textInput.length; i++) {
      if (i % 3 == 0 && i != 0) {
        formattedText += ' '; // Add a space every 3 characters
      }
      formattedText += textInput[i];
    }
    instance<AuthInputData>().registerPhoneController.value =  instance<AuthInputData>().registerPhoneController.value.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
    emit(RegisterPhoneInputFormatState(formattedText));

  }
}
