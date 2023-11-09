import 'package:get/get.dart';
import 'package:veralusso/app/controller/track_your_ticket_mail/track_ticket_controller.dart';

class TrackTicketListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackTicketController());
  }
}
