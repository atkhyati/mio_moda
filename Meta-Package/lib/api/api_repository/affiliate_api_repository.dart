import 'package:meta_package/api/api_endpoint/affiliate_api.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';

class AffiliateAPIRepository {
  String baseUrl;

  AffiliateAPIRepository({required this.baseUrl});

  late AffiliateApi baseApi = AffiliateApi(baseUrl: baseUrl);

  Future<CmsPageModel?> getAffiliateAPIResponse() async {
    return await baseApi.getAffiliateResponseProvider();
  }
}
