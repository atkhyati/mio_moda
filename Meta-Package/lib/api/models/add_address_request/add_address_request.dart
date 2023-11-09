import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';

part 'add_address_request.g.dart';

@JsonSerializable()
class AddAddressRequest {
  AddAddressRequest(
      {this.region,
      this.countryId,
      this.street,
      this.firstname,
      this.lastname,
      this.telephone,
      this.postcode,
      this.city,
      this.defaultBilling,
      this.defaultShipping,
      this.company});

  @JsonKey(name: 'region')
  Region? region;
  @JsonKey(name: 'country_id')
  String? countryId;
  @JsonKey(name: 'street')
  List<String>? street;
  @JsonKey(name: 'Firstname')
  String? firstname;
  @JsonKey(name: 'lastname')
  String? lastname;
  @JsonKey(name: 'telephone')
  String? telephone;
  @JsonKey(name: 'postcode')
  String? postcode;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'default_billing')
  bool? defaultBilling;
  @JsonKey(name: 'default_shipping')
  bool? defaultShipping;
  @JsonKey(name: 'company')
  String? company;

  factory AddAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressRequestToJson(this);
}

@JsonSerializable()
class CustomerData {
  CustomerDetails? customer;

  CustomerData({this.customer});

  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}

@JsonSerializable()
class CustomerDetails {
  CustomerDetails(
      {this.email,
      this.firstname,
      this.lastname,
      this.websiteId,
      this.addresses});

  String? email;
  String? firstname;
  String? lastname;
  @JsonKey(name: 'website_id')
  int? websiteId;
  dynamic addresses;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}
