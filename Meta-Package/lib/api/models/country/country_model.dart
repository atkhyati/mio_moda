import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryListModel {
  CountryListModel(
      {this.id,
      this.twoLetterAbbreviation,
      this.threeLetterAbbreviation,
      this.fullNameLocale,
      this.fullNameEnglish,
      this.availableRegions});

  String? id;
  @JsonKey(name: 'two_letter_abbreviation')
  String? twoLetterAbbreviation;
  @JsonKey(name: 'three_letter_abbreviation')
  String? threeLetterAbbreviation;
  @JsonKey(name: 'full_name_locale')
  String? fullNameLocale;
  @JsonKey(name: 'full_name_english')
  String? fullNameEnglish;
  @JsonKey(name: 'available_regions')
  List<AvailableRegion>? availableRegions;

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      _$CountryListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListModelToJson(this);
}

@JsonSerializable()
class AvailableRegion {
  AvailableRegion({
    this.id,
    this.code,
    this.name,
  });

  String? id;
  String? code;
  String? name;

  factory AvailableRegion.fromJson(Map<String, dynamic> json) =>
      _$AvailableRegionFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableRegionToJson(this);
}
