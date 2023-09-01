import 'package:flutter/material.dart';

import 'constants.dart';

extension T on String {
  String get arabicNumberToEnglish {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    var input = this;
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    print("$input after");
    return input;
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return !RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}


extension AdaptiveGridViewCount on BuildContext {
  /// Example:
  /// int columns = context.withFormFactor<int>(onMobile: 1, onTablet: 2, onDesktop: 4);
   T withFormFactor<T>({
  required T onMobile,
  required T onTablet,
  required T onDesktop,
  bool followDeviceOrientation = true,
}) {
     final formFactor = this.formFactor(followDeviceOrientation: followDeviceOrientation);
     return formFactor.isMobile ?
     onMobile : formFactor.isTablet ?
     onTablet :onDesktop;}
FormFactor formFactor({bool followDeviceOrientation = true}) {
     final width= followDeviceOrientation
         ? mediaQuery.size.width: mediaQuery.size.shortestSide;
  return width > ScreenWidthBreakpoints.desktop
  ? FormFactor.desktop
      : width > ScreenWidthBreakpoints.tablet
  ? FormFactor.tablet
  : FormFactor.mobile;
}
}
enum FormFactor { desktop, tablet, mobile }
class ScreenWidthBreakpoints {
  static const double desktop = 900;
  static const double tablet = 600;
  static const double mobile = 300;
}
extension FormFactorHelpers on FormFactor {

bool get isDesktop => this == FormFactor.desktop;
bool get isTablet => this == FormFactor.tablet;
bool get isMobile => this == FormFactor.mobile;
}
extension BuildContextEx on BuildContext {
MediaQueryData get mediaQuery=> MediaQuery.of(this);
}