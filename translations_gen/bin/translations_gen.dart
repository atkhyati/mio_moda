import 'dart:io';

import 'package:translations_gen/translations_gen.dart';
import 'package:yaml/yaml.dart';

void main() {
  // try to load settings from the project's pubspec.yaml
  final settings = _loadSettings();

  // display an error and quit if the input file hasn't been specified
  if ((settings[_YamlArguments.inputFilePath] == null)) {
    print('[ERROR] Input file path not defined. This must be specified in pubspec.yaml\n');
    return;
  }

  // parse csv to dart
  final flappyTranslator = TranslationsGen();
  flappyTranslator.generate(
    settings[_YamlArguments.inputFilePath],
    outputDir: settings[_YamlArguments.outputDir],
    fileName: settings[_YamlArguments.fileName],
    className: settings[_YamlArguments.className],
  );
}

/// The path to the pubspec file path
const _pubspecFilePath = 'pubspec.yaml';

const _yamlSectionId = 'translations_gen';

/// A class of arguments which the user can specify in pubspec.yaml
class _YamlArguments {
  static const inputFilePath = 'input_file_path';
  static const outputDir = 'output_dir';
  static const className = 'class_name';
  static const fileName = 'file_name';
}

/// Returns configuration settings  from pubspec.yaml
Map<String?, dynamic> _loadSettings() {
  final file = File(_pubspecFilePath);
  final yamlString = file.readAsStringSync();
  final Map<dynamic, dynamic> yamlMap = loadYaml(yamlString);

  // determine <String, dynamic> map from <dynamic, dynamic> yaml
  final settings = <String, dynamic>{};
  if (yamlMap.containsKey(_yamlSectionId)) {
    for (final kvp in yamlMap[_yamlSectionId].entries) {
      settings[kvp.key] = kvp.value;
    }
  }

  return settings;
}
