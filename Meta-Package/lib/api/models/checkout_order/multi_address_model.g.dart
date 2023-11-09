// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiAddressModel _$MultiAddressModelFromJson(Map<String, dynamic> json) =>
    MultiAddressModel(
      id: json['id'] as int?,
      groupId: json['group_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdIn: json['created_in'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      storeId: json['store_id'],
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
          ?.map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MultiAddressModelToJson(MultiAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
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
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
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
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'region_id': instance.regionId,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'customer_id': instance.customerId,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      regionCode: json['region_code'],
      region: json['region'],
      regionId: json['region_id'] as int?,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'region_code': instance.regionCode,
      'region': instance.region,
      'region_id': instance.regionId,
    };

CustomAttribute _$CustomAttributeFromJson(Map<String, dynamic> json) =>
    CustomAttribute(
      attributeCode: json['attribute_code'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CustomAttributeToJson(CustomAttribute instance) =>
    <String, dynamic>{
      'attribute_code': instance.attributeCode,
      'value': instance.value,
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
