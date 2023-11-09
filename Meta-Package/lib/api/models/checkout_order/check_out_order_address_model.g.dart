// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_order_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutOrderAddressModel _$CheckOutOrderAddressModelFromJson(
        Map<String, dynamic> json) =>
    CheckOutOrderAddressModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      add1: json['add1'] as String?,
      add2: json['add2'] as String?,
      add3: json['add3'] as String?,
      city: json['city'] as String?,
      countryName: json['countryName'] == null
          ? null
          : CountryListModel.fromJson(
              json['countryName'] as Map<String, dynamic>),
      state: json['state'] == null
          ? null
          : AvailableRegion.fromJson(json['state'] as Map<String, dynamic>),
      zipCode: json['zipCode'] as String?,
      phone: json['phone'] as String?,
      firstNameBilling: json['firstNameBilling'] as String?,
      lastNameBilling: json['lastNameBilling'] as String?,
      emailBilling: json['emailBilling'] as String?,
      add1Billing: json['add1Billing'] as String?,
      add2Billing: json['add2Billing'] as String?,
      add3Billing: json['add3Billing'] as String?,
      cityBilling: json['cityBilling'] as String?,
      countryNameBilling: json['countryNameBilling'] == null
          ? null
          : CountryListModel.fromJson(
              json['countryNameBilling'] as Map<String, dynamic>),
      stateBilling: json['stateBilling'] == null
          ? null
          : AvailableRegion.fromJson(
              json['stateBilling'] as Map<String, dynamic>),
      zipCodeBilling: json['zipCodeBilling'] as String?,
      phoneBilling: json['phoneBilling'] as String?,
      shippingCarrierCode: json['shippingCarrierCode'] as String?,
      shippingMethodCode: json['shippingMethodCode'] as String?,
    );

Map<String, dynamic> _$CheckOutOrderAddressModelToJson(
        CheckOutOrderAddressModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'add1': instance.add1,
      'add2': instance.add2,
      'add3': instance.add3,
      'city': instance.city,
      'countryName': instance.countryName,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'phone': instance.phone,
      'firstNameBilling': instance.firstNameBilling,
      'lastNameBilling': instance.lastNameBilling,
      'emailBilling': instance.emailBilling,
      'add1Billing': instance.add1Billing,
      'add2Billing': instance.add2Billing,
      'add3Billing': instance.add3Billing,
      'cityBilling': instance.cityBilling,
      'countryNameBilling': instance.countryNameBilling,
      'stateBilling': instance.stateBilling,
      'zipCodeBilling': instance.zipCodeBilling,
      'phoneBilling': instance.phoneBilling,
      'shippingCarrierCode': instance.shippingCarrierCode,
      'shippingMethodCode': instance.shippingMethodCode,
    };
