// ignore_for_file: inference_failure_on_collection_literal

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';

import '../../utils/validator.dart';
import '../api_client/api_exception.dart';
import '../api_endpoint/address_list_api.dart';
import '../models/add_address_request/add_address_request.dart';
import '../models/checkout_order/multi_address_model.dart' as multi_address;
import '../models/country/country_model.dart';

class AddAddressService {
  String baseUrl;
  late AddressListApi baseApi;

  factory AddAddressService(String baseUrl) {
    return AddAddressService._internal(baseUrl);
  }

  Rx<MyAccountDetails> getAdressList = MyAccountDetails().obs;

  AddAddressService._internal(this.baseUrl) {
    baseApi = AddressListApi(baseUrl: baseUrl);
  }

  Future<MyAccountDetails> addAddress(
      Rx<MyAccountDetails> getAdressList) async {
    this.getAdressList = getAdressList;
    var addressList = <dynamic>[].obs;
    for (var i in getAdressList.value.addresses!) {
      addressList.add(AddAddressRequest(
              region: i.region,
              countryId: "${i.countryId}",
              street: i.street,
              firstname: "${i.firstname}",
              lastname: "${i.lastname}",
              telephone: "${i.telephone}",
              postcode: "${i.postcode}",
              city: "${i.city}",
              defaultShipping: i.isShipping?.value ?? false,
              defaultBilling: i.isBilling?.value ?? false)
          .toJson());
    }

    return await postAddress(addressList);
  }

  Future<MyAccountDetails> postAddress(List<dynamic> addressList) async {
    var addAddressPost = CustomerData(
        customer: CustomerDetails(
      email: getAdressList.value.email.toString(),
      firstname: getAdressList.value.firstname.toString(),
      lastname: getAdressList.value.lastname.toString(),
      websiteId: getAdressList.value.websiteId,
      addresses: addressList,
    )).toJson();

    try {
      MyAccountDetails addressList =
          await postAddAddressApiResponse(json.encode(addAddressPost));
      getAdressList.value = addressList;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
    }
    return getAdressList.value;
  }

  Future<MyAccountDetails> getAddressListResponse() async {
    return await baseApi.getAddressListAPIResponse();
  }

  Future<MyAccountDetails> postAddAddressApiResponse(
    String requestJson,
  ) async {
    return await baseApi.postAddAddressResponse(
      requestJson: requestJson,
    );
  }

  Future<List<CountryListModel>> getCountryListResponse() async {
    return await baseApi.getCountryListAPIResponse();
  }

  Future<multi_address.MultiAddressModel> getMultiAddressAPIResponse() async {
    return await baseApi.getMultiAddressResponseProvider();
  }

  Future<MyAccountDetails> addNewAddress(MyAccountDetails getAdressList,
      AddAddressRequest addAddressRequest) async {
    this.getAdressList.value = getAdressList;
    var addressList = [].obs;
    if (getAdressList.addresses?.isNotEmpty == true) {
      for (var i in getAdressList.addresses!) {
        addressList.add(AddAddressRequest(
                region: i.region,
                countryId: "${i.countryId}",
                street: i.street,
                firstname: "${i.firstname}",
                lastname: "${i.lastname}",
                telephone: "${i.telephone}",
                postcode: "${i.postcode}",
                city: "${i.city}",
                defaultShipping: i.isShipping?.value ?? false,
                defaultBilling: i.isBilling?.value ?? false)
            .toJson());
      }
    }
    addressList.add(addAddressRequest.toJson());
    return await postAddress(addressList);
  }

  Future<MyAccountDetails?> updateAddress(MyAccountDetails getAddressList,
      AddAddressRequest updatedAddressRequest, String addressId) async {
    getAdressList.value = getAddressList;
    var addressList = (<Map<String, dynamic>>[]).obs;
    for (Address i in getAddressList.addresses ?? []) {
      if (i.id.toString() == addressId) {
        debugPrint("HEre Is One Time ");
        updatedAddressRequest.defaultShipping = i.isShipping?.value ?? false;
        updatedAddressRequest.defaultBilling = i.isBilling?.value ?? false;
        addressList.add(updatedAddressRequest.toJson());
      } else {
        debugPrint("HEre Is Two Time ");
        addressList.add(AddAddressRequest(
                region: i.region,
                countryId: "${i.countryId}",
                street: i.street,
                firstname: "${i.firstname}",
                lastname: "${i.lastname}",
                telephone: "${i.telephone}",
                postcode: "${i.postcode}",
                city: "${i.city}",
                defaultShipping: i.isShipping?.value ?? false,
                defaultBilling: i.isBilling?.value ?? false)
            .toJson());
      }
    }
    return await postAddress(addressList);
  }
}
