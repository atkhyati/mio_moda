// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequest _$AddAddressRequestFromJson(Map<String, dynamic> json) =>
    AddAddressRequest(
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      countryId: json['country_id'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      firstname: json['Firstname'] as String?,
      lastname: json['lastname'] as String?,
      telephone: json['telephone'] as String?,
      postcode: json['postcode'] as String?,
      city: json['city'] as String?,
      defaultBilling: json['default_billing'] as bool?,
      defaultShipping: json['default_shipping'] as bool?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$AddAddressRequestToJson(AddAddressRequest instance) =>
    <String, dynamic>{
      'region': instance.region,
      'country_id': instance.countryId,
      'street': instance.street,
      'Firstname': instance.firstname,
      'lastname': instance.lastname,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'default_billing': instance.defaultBilling,
      'default_shipping': instance.defaultShipping,
      'company': instance.company,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      customer: json['customer'] == null
          ? null
          : CustomerDetails.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'customer': instance.customer,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      websiteId: json['website_id'] as int?,
      addresses: json['addresses'],
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'website_id': instance.websiteId,
      'addresses': instance.addresses,
    };
