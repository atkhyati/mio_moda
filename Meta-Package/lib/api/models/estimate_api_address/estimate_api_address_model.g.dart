// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_api_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateAddressModel _$EstimateAddressModelFromJson(
        Map<String, dynamic> json) =>
    EstimateAddressModel(
      EstimateAddressItem.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EstimateAddressModelToJson(
        EstimateAddressModel instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

EstimateAddressItem _$EstimateAddressItemFromJson(Map<String, dynamic> json) =>
    EstimateAddressItem(
      region: json['region'] as String?,
      regionCode: json['region_code'] as String?,
      regionId: json['region_id'] as int?,
      countryId: json['country_id'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'],
      postcode: json['postcode'] as String?,
      city: json['city'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      customerId: json['customer_id'] as int?,
      sameAsBilling: json['same_as_billing'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$EstimateAddressItemToJson(
        EstimateAddressItem instance) =>
    <String, dynamic>{
      'region': instance.region,
      'region_id': instance.regionId,
      'region_code': instance.regionCode,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'customer_id': instance.customerId,
      'email': instance.email,
      'same_as_billing': instance.sameAsBilling,
    };
