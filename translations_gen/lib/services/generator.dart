import 'package:dart_style/dart_style.dart';
import 'package:translations_gen/services/file_writer.dart';
import 'package:translations_gen/template/template.dart';

class KeyMapGenerator {
  final String outputDir;
  final String fileName;
  final String className;
  final String _quoteString = '\'';
  late String _template;
  late String _fields;
  late List<Map<String, String>> _maps;
  late List<String> _supportedLanguages;

  String get formattedString => (_template);

  KeyMapGenerator({required this.outputDir, required this.fileName, required this.className}) {
    _template = Template.begining +
        Template.middleDontDependContext +
        Template.localeMaps() +
        Template.ending;
    _template = _template.replaceAll(TemplateKeys.className, className);
    _fields = '';
  }

  writeToFile(String formattedString) {
    final path = outputDir.isEmpty ? 'i18n.dart' : '$outputDir/$fileName.dart';
    FileWriter().write(contents: formattedString, path: path);
  }

  void addField(String key, String defaultWord, List<String> words) {
    final getTextString = '"$key"';

    String result = 'static String get $key => $getTextString;\n\n';

    _fields += result;
    _maps[0][key] = defaultWord;
    for (var wordIndex = 1; wordIndex < _supportedLanguages.length; wordIndex++) {
      _maps[wordIndex][key] =
          wordIndex < words.length && words[wordIndex].isNotEmpty ? words[wordIndex] : defaultWord;
    }
  }

  void setSupportedLanguages(List<String> supportedLanguages) {
    _supportedLanguages = supportedLanguages;

    var supportedLocals = 'static final Set<Locale> supportedLocals = {\n';
    for (var lang in supportedLanguages) {
      final parts = lang.split('_');
      supportedLocals += parts.length == 1
          ? '''Locale('${parts[0]}')'''
          : '''Locale('${parts[0]}', '${parts[1]}')''';
      supportedLocals += ',\n';
    }
    supportedLocals += '};';

    _template = _template.replaceAll(
      TemplateKeys.supportedLanguagesArea,
      '''
      $supportedLocals
      
      @override
      bool isSupported(Locale locale) => supportedLocals.contains(locale);
      ''',
    );

    _maps = List.generate(supportedLanguages.length, (index) => {});
  }

  void finalize() {
    _template = _template.replaceAll(TemplateKeys.fieldsArea, _fields);
    _generateMapValues();
  }

  String _formatString(String text) {
    text = text.replaceAll('"', '\\"');
    text = text.replaceAll('\$', '\\\$');

    return text;
  }

  void _generateMapValues() {
    final allValuesMap = <String, Map<String, String>>{};
    final mapsNames = <String>[];
    var result = '';

    for (var mapIndex = 0; mapIndex < _maps.length; mapIndex++) {
      final lang = _supportedLanguages[mapIndex];
      final map = _maps[mapIndex];
      final mapName = '_${lang.replaceAll('_', '')}Values';
      mapsNames.add(mapName);

      result += '''
      static const $mapName = {
      ''';

      map.forEach((key, value) {
        var formattedString = _formatString(value);
        if (_quoteString == '\'') {
          formattedString = formattedString.replaceAll('\'', '\\\'');
          // incase the string already had \' then it will become \\\\\', replace this with \\\'
          formattedString = formattedString.replaceAll('\\\\\'', '\\\'');
        }
        result += '''
        $_quoteString$key$_quoteString: $_quoteString$formattedString$_quoteString,
        ''';
      });

      result += '};\n\n';

      allValuesMap[lang] = map;
    }

    result += '''
    static const _allValues = {
    ''';

    _supportedLanguages.asMap().forEach((index, lang) {
      result += '''
        $_quoteString$lang$_quoteString: ${mapsNames[index]},
      ''';
    });

    result += '};';

    _template = _template.replaceAll(TemplateKeys.valuesArea, result);
  }
}
