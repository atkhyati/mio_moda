import 'package:solo_luxury/all_imports.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en');
  // Supported languages
  // Needs to be same order with locales
  // static final langs = [
  //   'English',
  // ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = LanguageConstantsDelegate.supportedLocals;

  @override
  Map<String, Map<String, String>> get keys => LanguageConstants.localeMaps;

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) {
    //final locale = _getLocaleFromLanguage(lang);
    var l = Locale(lang);
    if (locales.contains(l)) Get.updateLocale(l);
  }
}
