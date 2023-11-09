import 'package:meta_package/api/api_endpoint/order_track_api.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

class TrackYourOrderAPIRepository {
  String baseUrl;

  TrackYourOrderAPIRepository({required this.baseUrl});

  late OrderTrackApi baseApi = OrderTrackApi(baseUrl: baseUrl);

  Future<MyOrdersData> getTrackYourOrderApiResponse(String id) async {
    return await baseApi.getTrackYourOrderApiResponseProvider(id: id);
  }

  Future<MyOrdersDataItem> getGuestTrackYourOrderApiResponse(body) async {
    return await baseApi.getGuestTrackYourOrderApiResponseProvider(body: body);
  }
}
