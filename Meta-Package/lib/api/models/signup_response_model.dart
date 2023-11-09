import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  SignUpResponseModel({
    this.id,
    this.groupId,
    this.defaultBilling,
    this.defaultShipping,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
  });

  int? id;
  @JsonKey(name: 'group_id')
  int? groupId;
  @JsonKey(name: 'default_billing')
  String? defaultBilling;
  @JsonKey(name: 'default_shipping')
  String? defaultShipping;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_in')
  String? createdIn;
  String? dob;
  String? email;
  String? firstname;
  String? lastname;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'website_id')
  int? websiteId;
  List<Address>? addresses;
  @JsonKey(name: 'disable_auto_group_change')
  int? disableAutoGroupChange;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributes? extensionAttributes;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class Address {
  Address({
    this.id,
    this.customerId,
    this.region,
    this.regionId,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.defaultShipping,
    this.defaultBilling,
  });

  @JsonKey(name: 'region_code')
  dynamic regionCode;
  int? id;
  @JsonKey(name: 'customer_id')
  int? customerId;
  Region? region;
  @JsonKey(name: 'region_id')
  int? regionId;
  @JsonKey(name: 'country_id')
  String? countryId;
  List<String>? street;
  String? telephone;
  String? postcode;
  String? city;
  String? firstname;
  String? lastname;
  @JsonKey(name: 'default_shipping')
  bool? defaultShipping;
  @JsonKey(name: 'default_billing')
  bool? defaultBilling;

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
  String? regionCode;
  String? region;
  @JsonKey(name: 'region_id')
  int? regionId;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class ExtensionAttributes {
  ExtensionAttributes({
    this.isSubscribed,
  });

  @JsonKey(name: 'is_subscribed')
  bool? isSubscribed;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesToJson(this);
}
