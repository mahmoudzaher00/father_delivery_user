import 'dart:ui';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALISATIONS = "assets/translations";


const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}
//TODO:Get language of user on mobile
String MOBILE_APP_LANGUAGE = getCurrentLanguage();
String getCurrentLanguage() {
  Locale currentLocale = window.locale;
  String languageCode = currentLocale.languageCode;
  return languageCode;
}

