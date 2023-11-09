import 'package:meta_package/api/api_endpoint/about_api.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:meta_package/api/models/contact_us_request/contact_us_request.dart';
import 'package:meta_package/api/models/contact_us_response_model.dart';
import 'package:meta_package/api/models/terms_and_conditions/terms_and_condition_model.dart';

import '../models/faq/faq_model.dart';

class AboutAPIRepository {
  String baseUrl;

  AboutAPIRepository({required this.baseUrl});

  late AboutApi baseApi = AboutApi(baseUrl: baseUrl);

  Future<FaqModel> getFaqApiResponse({String? endpoint}) async {
    return await baseApi.getFaqResponseProvider(endpoint: endpoint);
  }

  Future<TermsAndConditionsModel> getTermsConditionResponse(
      {String? endpoint}) async {
    return await baseApi.getTermsConditionAPIProvider(endpoint: endpoint);
  }

  Future<CmsPageModel> getPrivacyPolicyResponse({String? endpoint}) async {
    return await baseApi.getPrivacyPolicyAPIResponseProvider(
        endpoint: endpoint);
  }

  Future<String> getReferFriendAPIResponse(
      {String? refFirstName,
      String? refEmail,
      String? refPhone,
      String? yourFirstName,
      String? yourEmail,
      String? yourPhone}) async {
    Map<String, dynamic> postData = {};
    postData['refFirstName'] = refFirstName;
    postData['refEmail'] = refEmail;
    postData['refPhone'] = refPhone;
    postData['yourFirstName'] = yourFirstName;
    postData['yourEmail'] = yourEmail;
    postData['yourPhone'] = yourPhone;
    return await baseApi.getReferFriendAPIProvider(body: "", data: postData);
  }

  Future<List<ContactUsResponseModel>> getContactUsApiResponse(
      String contactusRequestJson,
      String orderNo,
      String country,
      String subject,
      String message,
      String sourceOfTicket,
      String phoneNumber,
      String typeOfEnquiry,
      String email,
      String name,
      String lastName) async {
    Map<String, String> data = {};
    data["contactForm[name]"] = name.toString();
    data["contactForm[email]"] = email.toString();
    data["contactForm[phone_no]"] = phoneNumber.toString();
    data["contactForm[message]"] = message.toString();
    data["contactForm[lastname]"] = lastName.toString();
    data["contactForm[type_of_inquiry]"] = typeOfEnquiry.toString();
    data["contactForm[order_no]"] = orderNo.toString();
    data["contactForm[country]"] = country.toString();
    data["contactForm[subject]"] = subject.toString();
    data["contactForm[source_of_ticket]"] = sourceOfTicket.toString();

    return await baseApi.getContactUsResponseProvider(data: data);
  }

  Future<List<ContactUsResponseModel>> getContactUsApiData(
      ContactUsForm contactUsRequest) async {
    return await baseApi.postContactUsProvider(data: contactUsRequest.toJson());
  }
}
