import 'package:meta_package/api/api_endpoint/influencer_api.dart';

class InfluencerApiRepository {
  InfluencerApiRepository();

  late InfluencerApi baseApi = InfluencerApi();

  Future<Map<String, dynamic>> getInfluencerAPIResponse(
      String influencerRequestJson) async {
    return await baseApi.postInfluencerRegProvider(
        requestJson: influencerRequestJson);
  }
}
