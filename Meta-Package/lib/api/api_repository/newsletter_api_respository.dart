// import 'package:get/get.dart';
// import 'package:solo_luxury/data/model/my_account/my_account_model.dart';
// import 'package:solo_luxury/infrastructure/api_core/api_implementation.dart';
// import 'package:solo_luxury/infrastructure/api_core/base_http_core.dart';
//
// class NewsLetterAPIRepository extends GetxController {
//   final baseCall = BaseApiCalls();
//   final BaseApiImplementation baseApi = BaseApiImplementation();
//
//   Future<AppClientResponse<MyAccountDetails>> newsLetterAPIRepository(String requestJson, String endPoint) async {
//     AppClientResponse<MyAccountDetails> data = await baseCall.sendRequest(
//       baseApi.newsLetterAPIProvider(
//         requestJson: requestJson,
//         endPoint: endPoint,
//       ),
//     );
//     return data;
//   }
// }
import 'package:meta_package/api/models/newsletter/newsletter_response.dart';

import '../api_endpoint/newsletter_api.dart';

class NewsletterApiRepository {
  String baseUrl;

  NewsletterApiRepository({required this.baseUrl});

  late NewsletterApi baseApi = NewsletterApi(baseUrl: baseUrl);

  Future<NewsletterResponse> subscribeNewsLetter({String? email}) async {
    return await baseApi.subscribeNewsletterProvider(email: email);
  }

  Future<void> subscribeNewsletterProviderUser(body) async {
    return await baseApi.subscribeNewsletterProviderUser(body: body);
  }
}
