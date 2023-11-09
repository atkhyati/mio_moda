// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_address_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingAddressDataDart _$BillingAddressDataDartFromJson(
        Map<String, dynamic> json) =>
    BillingAddressDataDart(
      addressType: json['address_type'] as String,
      city: json['city'] as String,
      countryId: json['country_id'] as String,
      email: json['email'] as String,
      entityId: json['entity_id'] as int,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      parentId: json['parent_id'] as int,
      postcode: json['postcode'] as String,
      region: json['region'] as String,
      regionCode: json['region_code'] as String,
      regionId: json['region_id'] as int,
      street:
          (json['street'] as List<dynamic>).map((e) => e as String).toList(),
      telephone: json['telephone'] as String,
    );

Map<String, dynamic> _$BillingAddressDataDartToJson(
        BillingAddressDataDart instance) =>
    <String, dynamic>{
      'address_type': instance.addressType,
      'city': instance.city,
      'country_id': instance.countryId,
      'email': instance.email,
      'entity_id': instance.entityId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'parent_id': instance.parentId,
      'postcode': instance.postcode,
      'region': instance.region,
      'region_code': instance.regionCode,
      'region_id': instance.regionId,
      'street': instance.street,
      'telephone': instance.telephone,
    };
