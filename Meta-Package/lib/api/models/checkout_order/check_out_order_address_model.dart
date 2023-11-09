import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/country/country_model.dart';

part 'check_out_order_address_model.g.dart';

@JsonSerializable()
class CheckOutOrderAddressModel {
  CheckOutOrderAddressModel({
    this.firstName,
    this.lastName,
    this.email,
    this.add1,
    this.add2,
    this.add3,
    this.city,
    this.countryName,
    this.state,
    this.zipCode,
    this.phone,
    this.firstNameBilling,
    this.lastNameBilling,
    this.emailBilling,
    this.add1Billing,
    this.add2Billing,
    this.add3Billing,
    this.cityBilling,
    this.countryNameBilling,
    this.stateBilling,
    this.zipCodeBilling,
    this.phoneBilling,
    this.shippingCarrierCode,
    this.shippingMethodCode,
  });

  String? firstName = "";
  String? lastName = "";
  String? email = "";
  String? add1 = "";
  String? add2 = "";
  String? add3 = "";
  String? city = "";
  CountryListModel? countryName = CountryListModel();
  AvailableRegion? state = AvailableRegion();
  String? zipCode = "";
  String? phone = "";
  String? firstNameBilling = "";
  String? lastNameBilling = "";
  String? emailBilling = "";
  String? add1Billing = "";
  String? add2Billing = "";
  String? add3Billing = "";
  String? cityBilling = "";
  CountryListModel? countryNameBilling = CountryListModel();
  AvailableRegion? stateBilling = AvailableRegion();
  String? zipCodeBilling = "";
  String? phoneBilling = "";
  String? shippingCarrierCode = "freeshipping";
  String? shippingMethodCode = "freeshipping";

  factory CheckOutOrderAddressModel.fromJson(Map<String, dynamic> json) =>
      _$CheckOutOrderAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutOrderAddressModelToJson(this);
}
