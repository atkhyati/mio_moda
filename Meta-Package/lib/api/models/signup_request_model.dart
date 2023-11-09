// To parse this JSON data, do
//
//     final signUpRequestModel = signUpRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  SignUpRequestModel({
    this.customer,
    this.password,
  });

  Customer? customer;
  String? password;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}

@JsonSerializable()
class Customer {
  Customer({
    this.email,
    this.firstname,
    this.lastname,
    this.websiteId,
    this.addresses,
    this.dob,
    this.extensionAttributes,
  });

  String? email;
  String? firstname;
  String? lastname;
  @JsonKey(name: 'website_id')
  int? websiteId;
  List<AddressRequest>? addresses;
  String? dob;
  @JsonKey(name: 'extension_attributes')
  RequestExtensionAttributes? extensionAttributes;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class RequestExtensionAttributes {
  RequestExtensionAttributes({
    this.dom,
  });

  String? dom;

  factory RequestExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$RequestExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$RequestExtensionAttributesToJson(this);
}

@JsonSerializable()
class AddressRequest {
  AddressRequest({
    this.defaultShipping,
    this.defaultBilling,
    this.firstname,
    this.lastname,
    this.region,
    this.postcode,
    this.street,
    this.city,
    this.telephone,
    this.countryId,
  });

  bool? defaultShipping;
  bool? defaultBilling;
  String? firstname;
  String? lastname;
  RegionRequest? region;
  String? postcode;
  List<String>? street;
  String? city;
  String? telephone;
  String? countryId;

  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRequestToJson(this);
}

@JsonSerializable()
class RegionRequest {
  RegionRequest({
    this.regionCode,
    this.region,
    this.regionId,
  });

  String? regionCode;
  String? region;
  int? regionId;

  factory RegionRequest.fromJson(Map<String, dynamic> json) =>
      _$RegionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegionRequestToJson(this);
}
