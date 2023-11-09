// To parse this JSON data, do
//
//     final billingAddressDataDart = billingAddressDataDartFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'billing_address_data.g.dart';

@JsonSerializable()
class BillingAddressDataDart {
  BillingAddressDataDart({
    required this.addressType,
    required this.city,
    required this.countryId,
    required this.email,
    required this.entityId,
    required this.firstname,
    required this.lastname,
    required this.parentId,
    required this.postcode,
    required this.region,
    required this.regionCode,
    required this.regionId,
    required this.street,
    required this.telephone,
  });

  @JsonKey(name: 'address_type')
  String addressType;
  String city;
  @JsonKey(name: 'country_id')
  String countryId;
  String email;
  @JsonKey(name: 'entity_id')
  int entityId;
  String firstname;
  String lastname;
  @JsonKey(name: 'parent_id')
  int parentId;
  String postcode;
  String region;
  @JsonKey(name: 'region_code')
  String regionCode;
  @JsonKey(name: 'region_id')
  int regionId;
  List<String> street;
  String telephone;

  factory BillingAddressDataDart.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressDataDartFromJson(json);

  Map<String, dynamic> toJson() => _$BillingAddressDataDartToJson(this);
}
