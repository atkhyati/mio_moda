// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListModel _$CountryListModelFromJson(Map<String, dynamic> json) =>
    CountryListModel(
      id: json['id'] as String?,
      twoLetterAbbreviation: json['two_letter_abbreviation'] as String?,
      threeLetterAbbreviation: json['three_letter_abbreviation'] as String?,
      fullNameLocale: json['full_name_locale'] as String?,
      fullNameEnglish: json['full_name_english'] as String?,
      availableRegions: (json['available_regions'] as List<dynamic>?)
          ?.map((e) => AvailableRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryListModelToJson(CountryListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'two_letter_abbreviation': instance.twoLetterAbbreviation,
      'three_letter_abbreviation': instance.threeLetterAbbreviation,
      'full_name_locale': instance.fullNameLocale,
      'full_name_english': instance.fullNameEnglish,
      'available_regions': instance.availableRegions,
    };

AvailableRegion _$AvailableRegionFromJson(Map<String, dynamic> json) =>
    AvailableRegion(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AvailableRegionToJson(AvailableRegion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
