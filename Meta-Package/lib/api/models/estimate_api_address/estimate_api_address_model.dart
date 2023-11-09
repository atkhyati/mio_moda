import 'package:json_annotation/json_annotation.dart';

part 'estimate_api_address_model.g.dart';

@JsonSerializable()
class EstimateAddressModel {
  @JsonKey()
  final EstimateAddressItem address;

  EstimateAddressModel(this.address);
  factory EstimateAddressModel.fromJson(Map<String, dynamic> json) =>
      _$EstimateAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateAddressModelToJson(this);
}

@JsonSerializable()
class EstimateAddressItem {
  EstimateAddressItem(
      {this.region,
      this.regionCode,
      this.regionId,
      this.countryId,
      this.street,
      this.telephone,
      this.postcode,
      this.city,
      this.firstname,
      this.lastname,
      this.customerId,
      this.sameAsBilling,
      this.email});

  final String? region;

  @JsonKey(name: 'region_id')
  final int? regionId;

  @JsonKey(name: 'region_code')
  final String? regionCode;

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

  final String? email;

  @JsonKey(name: 'same_as_billing')
  final int? sameAsBilling;

  factory EstimateAddressItem.fromJson(Map<String, dynamic> json) =>
      _$EstimateAddressItemFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateAddressItemToJson(this);
}
