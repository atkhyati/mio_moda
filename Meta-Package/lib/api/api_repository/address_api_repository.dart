import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';

import '../models/add_address_request/add_address_request.dart';

class AddressAPIRepository {
  AddressAPIRepository({required this.addressService});

  final AddAddressService addressService;

  Future<MyAccountDetails?> getAddressListResponse() async {
    return await addressService.getAddressListResponse();
  }

  Future<MyAccountDetails> postAddAddressApiResponse(
    String requestJson,
  ) async {
    return await addressService.postAddAddressApiResponse(
      requestJson,
    );
  }

  Future<MyAccountDetails> addNewAddress(MyAccountDetails getAddressList,
      AddAddressRequest addAddressRequest) async {
    return await addressService.addNewAddress(
        getAddressList, addAddressRequest);
  }

  Future<MyAccountDetails?> updateAddress(MyAccountDetails getAddressList,
      AddAddressRequest addAddressRequest, String addressId) async {
    return await addressService.updateAddress(
        getAddressList, addAddressRequest, addressId);
  }

  Future<List<CountryListModel>?> getCountryListResponse() async {
    return await addressService.getCountryListResponse();
  }

  Future<MultiAddressModel?> getMultiAddressAPIResponse() async {
    return await addressService.getMultiAddressAPIResponse();
  }

  Future<MyAccountDetails> addAddress(
      Rx<MyAccountDetails> getAdressList) async {
    return await addressService.addAddress(getAdressList);
  }
}
