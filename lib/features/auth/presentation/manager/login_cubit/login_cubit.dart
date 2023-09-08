import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/auth/presentation/views/auth_input_data.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void formatInput() {
    if (instance<AuthInputData>().loginPhoneController.text.isEmpty) {
      return;
    }
    String textInput = instance<AuthInputData>().loginPhoneController.text.replaceAll(RegExp(r'\s+'), '');

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
    instance<AuthInputData>().loginPhoneController.value =  instance<AuthInputData>().loginPhoneController.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
        );
    emit(LoginPhoneInputFormatState(formattedText));

}








}
