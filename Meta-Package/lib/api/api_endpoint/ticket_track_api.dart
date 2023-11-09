import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class TicketTrackApi<T> extends TicketTrackApiInterface {
  static const String myTrackTicket = '/rest/V1/mytickets/byEmail/';

  String baseUrl;
  late DioClient client;

  TicketTrackApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<TrackTicketModal>> trackTicketEmailAPIProvider(
      {required String email}) async {
    try {
      final response = await client.getClient<List<dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$myTrackTicket$email",
          token: true);
      List<TrackTicketModal> trackData =
          response.many((json) => TrackTicketModal.fromJson(json));
      if (trackData.isNotEmpty && trackData.length == 1) {
        if (trackData[0].error != null && !trackData[0].error!) {
          if (trackData[0].message != null &&
              trackData[0].message == 'No tickets Found') {
            return [];
          }
        }
      }

      debugPrint("Track data ${trackData.length}");
      return trackData;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class TicketTrackApiInterface<T> {
  Future<T?> trackTicketEmailAPIProvider({required String email});
}
