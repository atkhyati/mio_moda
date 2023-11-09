import 'package:get/get.dart';
import 'package:veralusso/app/controller/contact_us/contact_us_controller.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
