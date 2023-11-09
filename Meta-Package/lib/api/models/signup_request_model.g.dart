// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'password': instance.password,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      websiteId: json['website_id'] as int?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      dob: json['dob'] as String?,
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : RequestExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'website_id': instance.websiteId,
      'addresses': instance.addresses,
      'dob': instance.dob,
      'extension_attributes': instance.extensionAttributes,
    };

RequestExtensionAttributes _$RequestExtensionAttributesFromJson(
        Map<String, dynamic> json) =>
    RequestExtensionAttributes(
      dom: json['dom'] as String?,
    );

Map<String, dynamic> _$RequestExtensionAttributesToJson(
        RequestExtensionAttributes instance) =>
    <String, dynamic>{
      'dom': instance.dom,
    };

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) =>
    AddressRequest(
      defaultShipping: json['defaultShipping'] as bool?,
      defaultBilling: json['defaultBilling'] as bool?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      region: json['region'] == null
          ? null
          : RegionRequest.fromJson(json['region'] as Map<String, dynamic>),
      postcode: json['postcode'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      city: json['city'] as String?,
      telephone: json['telephone'] as String?,
      countryId: json['countryId'] as String?,
    );

Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'defaultShipping': instance.defaultShipping,
      'defaultBilling': instance.defaultBilling,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'region': instance.region,
      'postcode': instance.postcode,
      'street': instance.street,
      'city': instance.city,
      'telephone': instance.telephone,
      'countryId': instance.countryId,
    };

RegionRequest _$RegionRequestFromJson(Map<String, dynamic> json) =>
    RegionRequest(
      regionCode: json['regionCode'] as String?,
      region: json['region'] as String?,
      regionId: json['regionId'] as int?,
    );

Map<String, dynamic> _$RegionRequestToJson(RegionRequest instance) =>
    <String, dynamic>{
      'regionCode': instance.regionCode,
      'region': instance.region,
      'regionId': instance.regionId,
    };
