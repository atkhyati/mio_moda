import 'dart:io';

import 'package:translations_gen/services/file_writer.dart';
import 'package:translations_gen/services/generator.dart';
import 'package:translations_gen/services/parsers/csv_parser.dart';
import 'package:translations_gen/services/parsers/file_parser.dart';
import 'package:translations_gen/services/validation.dart';

class TranslationsGen {
  void generate(
    String inputFilePath, {
    String? outputDir,
    String? fileName,
    String? className,
  }) {
    final file = File(inputFilePath);
    Validator.validateFile(file);
    print("File validation complete");

    final codeGenerator = KeyMapGenerator(
      className: className ?? "LanguageConstants",
      outputDir: outputDir!,
      fileName: fileName!,
    );

    final parser = CSVParser(
      file: file,
      startIndex: 1,
      fieldDelimiter: ',',
    );
    print("loaded csv");

    final supportedLanguages = parser.supportedLanguages;
    // Validator.validateSupportedLanguages(supportedLanguages);
    codeGenerator.setSupportedLanguages(supportedLanguages);
    print("Supported langs => $supportedLanguages");

    final localizationsTable = parser.localizationsTable;
    Validator.validateLocalizationsTable(localizationsTable);

    final List<LocalizationTableRow> newTable = [];
    // Remove duplicate keys
    for (var e in localizationsTable) {
      if (!newTable.any((newE) => e.key == newE.key)) {
        newTable.add(e);
      }
    }

    for (final row in newTable) {
      if (Validator.validateLocalizationTableRow(
        row,
        numberSupportedLanguages: supportedLanguages.length,
      )) codeGenerator.addField(row.key, row.defaultWord, row.words);
    }

    codeGenerator.finalize();

    // format the contents according to dart defaults
    final formattedString = codeGenerator.formattedString;

    // write output file
    final path = outputDir.isEmpty ? 'i18n.dart' : '$outputDir/$fileName.dart';
    FileWriter().write(contents: formattedString, path: path);
  }
}
