// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/special_request/widgets/special_common_text_field.dart';

import '../../../controller/special_request/special_request_controller.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  const SpecialRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(
          title: Get.arguments[1] == "brand"
              ? LanguageConstants.brandProductQuery.tr
              : LanguageConstants.categoryProductQuery.tr,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.w,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        NameTextField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        LastNameField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        EmailField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        PhoneNumberField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        BrandNameField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        StyleField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        KeywordField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        ImageUrlField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        RemarkField(),
                        SizedBox(
                          height: 45.h,
                        ),
                        SubmitAccountButton(),
                        SizedBox(
                          height: 45.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const ScreenLoading()
                      : const SizedBox(),
                ),
              ],
            )),
      ),
    );
  }
}
