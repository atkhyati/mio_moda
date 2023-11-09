import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/change_password_controller.dart';

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
