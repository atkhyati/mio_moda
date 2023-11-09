import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

import '../models/checkout_order/multi_address_model.dart' as multi_address;

class AddressListApi<T> extends AddressListApiInterface {
  static const String addAddress = '/rest/V1/customers/me';
  static const String addressList = "/rest/V1/customers/me";
  static const String multiAddressEndPoint = "/rest/V1/customers/me";
  static const String countryList = '/rest/V1/directory/countries';

  String baseUrl;
  late DioClient client;

  AddressListApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<MyAccountDetails> postAddAddressResponse(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "PUT", "$baseUrl/${LocalStore.localStore.currentCode}$addAddress",
          body: requestJson,
          additionalHeaders: {"Accept": "application/json"},
          token: true);
      return response.one((json) => MyAccountDetails.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<MyAccountDetails> getAddressListAPIResponse() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", "$baseUrl/${LocalStore.localStore.currentCode}$addressList",
          token: true);
      return response.one((json) => MyAccountDetails.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<multi_address.MultiAddressModel>
      getMultiAddressResponseProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$multiAddressEndPoint",
          token: true);
      return response
          .one((json) => multi_address.MultiAddressModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<CountryListModel>> getCountryListAPIResponse() async {
    try {
      final response =
          await client.getClient<List<dynamic>>("GET", baseUrl + countryList);
      return response.many((json) => CountryListModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class AddressListApiInterface<T> {
  Future<T?> getAddressListAPIResponse();

  Future<T?> postAddAddressResponse({required String requestJson});

  Future<T?> getMultiAddressResponseProvider();

  Future<T?> getCountryListAPIResponse();
}
