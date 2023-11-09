import 'package:json_annotation/json_annotation.dart';

part 'logo_model.g.dart';

@JsonSerializable()
class LogoModel {
  LogoModel({
    this.logoUrl,
    this.logoAlt,
    this.logoWidth,
    this.logoHeight,
  });

  @JsonKey(name: 'logo_url')
  String? logoUrl;
  @JsonKey(name: 'logo_alt')
  String? logoAlt;
  @JsonKey(name: 'logo_width')
  int? logoWidth;
  @JsonKey(name: 'logo_height')
  int? logoHeight;

  factory LogoModel.fromJson(Map<String, dynamic> json) =>
      _$LogoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoModelToJson(this);
}
