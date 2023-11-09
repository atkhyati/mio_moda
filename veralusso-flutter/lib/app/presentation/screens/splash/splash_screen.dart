import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/controller/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: controller.scaffoldKey.value,
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: 240.w,
          child: SvgPicture.asset(AppAsset.appLogo,
             fit: BoxFit.fitWidth,),
        ),
      ),
    ));
  }
}
