// To parse this JSON data, do
//
//     final multiAddressModel = multiAddressModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'multi_address_model.g.dart';

@JsonSerializable()
class MultiAddressModel {
  MultiAddressModel({
    this.id,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.dob,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
    this.customAttributes,
  });

  final int? id;
  @JsonKey(name: 'group_id')
  final int? groupId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_in')
  final String? createdIn;
  final String? dob;
  final String? email;
  final String? firstname;
  final String? lastname;
  @JsonKey(name: 'store_id')
  final dynamic storeId;
  @JsonKey(name: 'website_id')
  final int? websiteId;
  final List<Address>? addresses;
  @JsonKey(name: 'disable_auto_group_change')
  final int? disableAutoGroupChange;
  @JsonKey(name: 'extension_attributes')
  final ExtensionAttributes? extensionAttributes;
  @JsonKey(name: 'custom_attributes')
  List<CustomAttribute>? customAttributes;

  factory MultiAddressModel.fromJson(Map<String, dynamic> json) =>
      _$MultiAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$MultiAddressModelToJson(this);
}

@JsonSerializable()
class Address {
  Address({
    this.id,
    this.region,
    this.regionId,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
  });

  final int? id;
  final Region? region;
  @JsonKey(name: 'region_id')
  final int? regionId;
  @JsonKey(name: 'country_id')
  final String? countryId;
  final List<String>? street;
  final dynamic telephone;
  final String? postcode;
  final dynamic city;
  final dynamic firstname;
  final dynamic lastname;
  @JsonKey(name: 'customer_id')
  final int? customerId;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Region {
  Region({
    this.regionCode,
    this.region,
    this.regionId,
  });

  @JsonKey(name: 'region_code')
  dynamic regionCode;
  dynamic region;
  @JsonKey(name: 'region_id')
  int? regionId;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class CustomAttribute {
  CustomAttribute({
    this.attributeCode,
    this.value,
  });

  @JsonKey(name: 'attribute_code')
  String? attributeCode;
  String? value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$CustomAttributeToJson(this);
}

@JsonSerializable()
class ExtensionAttributes {
  ExtensionAttributes({
    this.isSubscribed,
  });

  @JsonKey(name: 'is_subscribed')
  final bool? isSubscribed;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesToJson(this);
}
