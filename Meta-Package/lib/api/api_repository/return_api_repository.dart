import 'package:meta_package/api/api_endpoint/return_api.dart';
import 'package:meta_package/api/models/return_reason/return_reason_model.dart';

import '../models/returns_refunds/returns_refunds_model.dart';

class ReturnAPIRepository {
  String baseUrl;

  ReturnAPIRepository({required this.baseUrl});

  late ReturnApi baseApi = ReturnApi(baseUrl: baseUrl);

  Future<List<ReturnReasonModel>> getReturnReasonResponse() async {
    return await baseApi.getReturnReasonResponseProvider();
  }

  Future<Map<String, dynamic>> postReturnItemAPIResponse(
    String orderId,
    String productSku,
    String email,
    String reason,
    String langCode,
  ) async {
    Map<String, String> data = {};
    data["returnForm[order_id]"] = orderId.toString();
    data["returnForm[product_sku]"] = productSku.toString();
    data["returnForm[customer_email]"] = email.toString();
    data["returnForm[type]"] = "return";
    data["returnForm[reason]"] = reason.toString();
    data["returnForm[lang_code]"] = langCode.toString();
    data["returnForm[website]"] = "www.sololuxury.com";
    return await baseApi.postReturnItemAPIProvider(data: data);
  }

  Future<List<CmsText>> getReturnsRefundsApiResponse() async {
    return await baseApi.getReturnsRefundsApiResponseProvider();
  }
}
