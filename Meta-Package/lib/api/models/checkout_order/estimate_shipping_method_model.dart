import 'package:json_annotation/json_annotation.dart';

part 'estimate_shipping_method_model.g.dart';

@JsonSerializable()
class EstimateShippingMethodModel {
  EstimateShippingMethodModel(
      {this.carrierCode,
      this.methodCode,
      this.carrierTitle,
      this.methodTitle,
      this.amount,
      this.baseAmount,
      this.available,
      this.errorMessage,
      this.priceExclTax,
      this.priceInclTax});

  @JsonKey(name: 'carrier_code')
  String? carrierCode;
  @JsonKey(name: 'method_code')
  String? methodCode;
  @JsonKey(name: 'carrier_title')
  String? carrierTitle;
  @JsonKey(name: 'method_title')
  String? methodTitle;
  int? amount;
  @JsonKey(name: 'base_amount')
  int? baseAmount;
  bool? available;
  @JsonKey(name: 'error_message')
  String? errorMessage;
  @JsonKey(name: 'price_excl_tax')
  int? priceExclTax;
  @JsonKey(name: 'price_incl_tax')
  int? priceInclTax;

  factory EstimateShippingMethodModel.fromJson(Map<String, dynamic> json) =>
      _$EstimateShippingMethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateShippingMethodModelToJson(this);
}
