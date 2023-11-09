// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoModel _$LogoModelFromJson(Map<String, dynamic> json) => LogoModel(
      logoUrl: json['logo_url'] as String?,
      logoAlt: json['logo_alt'] as String?,
      logoWidth: json['logo_width'] as int?,
      logoHeight: json['logo_height'] as int?,
    );

Map<String, dynamic> _$LogoModelToJson(LogoModel instance) => <String, dynamic>{
      'logo_url': instance.logoUrl,
      'logo_alt': instance.logoAlt,
      'logo_width': instance.logoWidth,
      'logo_height': instance.logoHeight,
    };
