import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/faq/faq_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/faq/widgets/expansion_til.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../theme/app_text_style.dart';
import '../../common_widget/common_theme_button.dart';

class FaqScreen extends GetView<FaqController> {
  FaqScreen({Key? key}) : super(key: key);

  final FaqController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonBacground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: commonAppbar(title: LanguageConstants.faqText.tr),
          body: controller.isLoadding.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xff973133),
                  ),
                )
              // ignore: prefer_const_constructors
              : pageView(),
        ),
      ),
    );
  }

  Widget pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        // color: appColorAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                          controller: controller.feqText,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              isDense: true,
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderGrey, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              // contentPadding:
                              //     const EdgeInsets.only(top: 10, left: 15),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderGrey, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: borderGrey, width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              counterText: '',
                              hintText: LanguageConstants.faqText.tr,
                              filled: true,
                              fillColor: whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40.w,
                      child: CommonThemeButton(
                          onTap: () {
                            controller.getFaqList.refresh();
                            highlightText();
                          },
                          title: LanguageConstants.highlightText.tr),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.getFaqList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    debugPrint(
                        "DATADATA ========${controller.getFaqList[index].title.toString()}");
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTil(
                        verticalVisualDensity: -1,
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 20),
                        title: Text(
                            controller.getFaqList[index].title
                                .toString()
                                .toUpperCase(),
                            style: AppTextStyle.textStyleUtils400(size: 18)),
                        isIcon: controller.getFaqList.isEmpty ? true : false,
                        children: [
                          Container(
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Html(
                              data: controller.getFaqList[index].description
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void highlightText() {
    for (int i = 0; i < controller.getFaqList.length; i++) {
      controller.getFaqList[i].description = controller
          .getFaqList[i].description
          .toString()
          .replaceAll("<span style='background-color:yellow'>", "");
      controller.getFaqList[i].description = controller
          .getFaqList[i].description
          .toString()
          .replaceAll("</span>", "");

      String temp = controller.getFaqList[i].description!;

      int startValue = 0;
      int index = -1;
      String serchtext = controller.feqText.text.trim();
      if (serchtext.isNotEmpty) {
        do {
          index =
              temp.toUpperCase().indexOf(serchtext.toUpperCase(), startValue);
          if (index != -1) {
            String substring = temp.substring(index, index + serchtext.length);
            String changeHtml =
                "<span style='background-color:yellow'>$substring</span>";
            temp =
                temp.replaceRange(index, index + serchtext.length, changeHtml);
            startValue = index + changeHtml.length - serchtext.length;
          }
        } while (index != -1);
        controller.getFaqList[i].description = temp;
      }
    }
  }
}
