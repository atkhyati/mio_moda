import 'package:meta_package/api/api_endpoint/ticket_track_api.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';

class TrackTicketEmailAPIRepository {
  String baseUrl;

  TrackTicketEmailAPIRepository({required this.baseUrl});

  late TicketTrackApi baseApi = TicketTrackApi(baseUrl: baseUrl);

  Future<List<TrackTicketModal>> getTrackTicketEmailResponse(
      String email) async {
    return await baseApi.trackTicketEmailAPIProvider(email: email);
  }
}
