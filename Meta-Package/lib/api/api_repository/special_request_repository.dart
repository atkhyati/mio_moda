import 'package:meta_package/api/api_endpoint/special_request_api.dart';

class SpecialRequestRepository {
  String baseUrl;

  SpecialRequestRepository({required this.baseUrl});

  late SpecialRequestApi baseApi = SpecialRequestApi(baseUrl: baseUrl);

  Future<Map<String, dynamic>> getSpecialRequestApiResponse(
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String brandName,
      String styleName,
      String keywordName,
      String imageUrl,
      String remarks,
      String id,
      String currentCode) async {
    var requestJson = {
      "ticketForm": {
        "name": firstName.toString(),
        "last_name": lastName.toString(),
        "email": email.toString(),
        "phone": phoneNumber.toString(),
        "brand": brandName.toString(),
        "style": styleName.toString(),
        "keyword": keywordName.toString(),
        "image_url": imageUrl.toString(),
        "remarks": remarks.toString(),
        "customer_id": id,
        "lang_code": currentCode
      }
    };
    return await baseApi.specialRequestAPIResponse(body: requestJson);
  }
}
