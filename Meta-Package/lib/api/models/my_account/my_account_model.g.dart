// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAccountDetails _$MyAccountDetailsFromJson(Map<String, dynamic> json) =>
    MyAccountDetails(
      id: json['id'] as int?,
      groupId: json['group_id'] as int?,
      defaultBilling: json['default_billing'] as String?,
      defaultShipping: json['default_shipping'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdIn: json['created_in'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      storeId: json['store_id'] as int?,
      websiteId: json['website_id'] as int?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      disableAutoGroupChange: json['disable_auto_group_change'] as int?,
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
      customAttributes: (json['custom_attributes'] as List<dynamic>?)
          ?.map((e) => CustomAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyAccountDetailsToJson(MyAccountDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'default_billing': instance.defaultBilling,
      'default_shipping': instance.defaultShipping,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_in': instance.createdIn,
      'dob': instance.dob,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'store_id': instance.storeId,
      'website_id': instance.websiteId,
      'addresses': instance.addresses,
      'disable_auto_group_change': instance.disableAutoGroupChange,
      'extension_attributes': instance.extensionAttributes,
      'custom_attributes': instance.customAttributes,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as int?,
      customerId: json['customer_id'] as int?,
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      regionId: json['region_id'] as int?,
      countryId: json['country_id'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'] as String?,
      postcode: json['postcode'] as String?,
      city: json['city'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      defaultBilling: json['default_billing'] as bool?,
      defaultShipping: json['default_shipping'] as bool?,
      company: json['company'] as String?,
    )..regionCode = json['region_code'];

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'region_code': instance.regionCode,
      'id': instance.id,
      'customer_id': instance.customerId,
      'region': instance.region,
      'region_id': instance.regionId,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'default_billing': instance.defaultBilling,
      'default_shipping': instance.defaultShipping,
      'company': instance.company,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      regionCode: json['region_code'] as String?,
      region: json['region'] as String?,
      regionId: json['region_id'] as int?,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'region_code': instance.regionCode,
      'region': instance.region,
      'region_id': instance.regionId,
    };

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) =>
    ExtensionAttributes(
      isSubscribed: json['is_subscribed'] as bool?,
    );

Map<String, dynamic> _$ExtensionAttributesToJson(
        ExtensionAttributes instance) =>
    <String, dynamic>{
      'is_subscribed': instance.isSubscribed,
    };

CustomAttributes _$CustomAttributesFromJson(Map<String, dynamic> json) =>
    CustomAttributes(
      attributeCode: json['attribute_code'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CustomAttributesToJson(CustomAttributes instance) =>
    <String, dynamic>{
      'attribute_code': instance.attributeCode,
      'value': instance.value,
    };
