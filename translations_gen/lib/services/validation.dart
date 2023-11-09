import 'dart:io';

import 'package:translations_gen/constants.dart';
import 'package:translations_gen/extensions/file_extensions.dart';
import 'package:translations_gen/extensions/string_extensions.dart';
import 'package:translations_gen/services/parsers/file_parser.dart';

abstract class Validator {
  /// Validates whether [file] is valid
  ///
  /// If any error occurs, process is terminated
  static void validateFile(File file) {
    // check that the file exists
    if (!file.existsSync()) {
      print('File ${file.path} does not exist!');
    }

    // check that the file extension is correct
    if (!file.hasValidExtension) {
      print(
        'File ${file.path} has extension ${file.extensionType} which is not supported!',
      );
    }
  }

  /// Validates whether [supportedLanguages] are valid
  ///
  /// If any error occurs, process is terminated
  static void validateSupportedLanguages(List<String> supportedLanguages) {
    for (final supportedLanguage in supportedLanguages) {
      if (!supportedLanguage.isValidLocale) {
        print(
            '$supportedLanguage isn\'t a valid locale. Expected locale of the form "en" or "en_US".');
      }

      final languageCode = supportedLanguage.split('_').first;
      if (!Constants.flutterLocalizedLanguages.contains(languageCode)) {
        print('$languageCode isn\'t supported by default in Flutter.');
        print(
            'Please see https://flutter.dev/docs/development/accessibility-and-localization/internationalization#adding-support-for-a-new-language for info on how to add required classes.');
      }
    }
  }

  /// Validates whether [localizationsTable] is valid
  ///
  /// If any error occurs, process is terminated
  static void validateLocalizationsTable(List<LocalizationTableRow> localizationsTable) {
    if (localizationsTable.isEmpty) {
      print('No keys found.');
    }
  }

  /// Validates whether [row] is valid
  ///
  /// If any error occurs, process is terminated
  static bool validateLocalizationTableRow(
    LocalizationTableRow row, {
    required int numberSupportedLanguages,
  }) {
    final key = row.key;
    if (Constants.reservedWords.contains(key)) {
      print('Key $key in row ${row.raw} is a reserved keyword in Dart and is thus invalid.');
      return false;
    }

    if (Constants.types.contains(key)) {
      print('Key $key in row ${row.raw} is a type in Dart and is thus invalid.');
      return false;
    }

    if (!key.isValidVariableName) {
      print('Key $key in row ${row.raw} is invalid. Expected key in the form lowerCamelCase.');
      return false;
    }

    final words = row.words;
    if (words.length > numberSupportedLanguages) {
      print(
          'The row ${row.raw} does not seem to be well formatted. Found ${words.length} values for numberSupportedLanguages locales.');
      return false;
    }

    final defaultWord = row.defaultWord;
    if (defaultWord.isEmpty) {
      print('Key $key in row ${row.raw} has no translation for default language.');
      return false;
    }
    return true;
  }
}
