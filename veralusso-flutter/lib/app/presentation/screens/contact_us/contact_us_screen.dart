import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:veralusso/app/controller/contact_us/contact_us_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/screens/contact_us/widgets/contact_field.dart';
import 'package:veralusso/app/presentation/screens/contact_us/widgets/submit_account_button.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: Colors.white,
          appBar: commonAppbar(title: LanguageConstants.contactUsText.tr),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        LanguageConstants.orderenquiriesText.tr,
                        style: AppTextStyle.textStyleUtils600(size: 16.sp),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        LanguageConstants
                            .whateverYourQueryUseTheContactFormBelowMsg.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(
                                color: Colors.black54, size: 12.5.sp)
                            .copyWith(height: 1.4),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: NameTextField()),
                    const SizedBox(height: 12),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: SurNameTextField()),
                    const SizedBox(height: 12),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: EmailTextField()),
                    const SizedBox(height: 12),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: PhoneTextField()),
                    const SizedBox(height: 12),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: textFieldBoarderColor, width: 2)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.expand_more_outlined,
                              color: appColor),
                          value: controller.chosenValue.value,
                          elevation: 2,
                          style: AppTextStyle.textStyleUtils400(
                              color: Colors.grey),
                          items: controller.data
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: value ==
                                        LanguageConstants
                                            .typeOfEnquiryTextveralusso.tr
                                    ? AppTextStyle.textStyleUtils400(
                                        size: 14.0, color: grey636363)
                                    : AppTextStyle.textStyleUtils400(
                                        size: 14.0),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            LanguageConstants.typeOfEnquiryTextveralusso.tr,
                            style: AppTextStyle.textStyleUtils400(
                                color: grey636363),
                          ),
                          onChanged: (String? value) {
                            controller.chosenValue.value = value!;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: SubjectTextField()),
                    const SizedBox(height: 12),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: textFieldBoarderColor, width: 2)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.expand_more_outlined,
                              color: appColor),
                          value: controller.chosenCountry.value,
                          elevation: 2,
                          style: AppTextStyle.textStyleUtils400(
                              color: Colors.grey),
                          items: controller.countryController.storeWebsitesList
                              .map((item) {
                            // StoreWebSitesModel item1 = StoreWebSitesModel.fromJson(item);
                            StoreWebSitesModel item1 = item;
                            return DropdownMenuItem(
                                value: item1.name.toString(),
                                child: Text(
                                  item1.name ?? '',
                                  //Names that the api dropdown contains
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 14.0),
                                ) //Id that has to be passed that the dropdown has.....
                                //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                );
                          }).toList(),
                          hint: Text(LanguageConstants.countryText.tr),
                          onChanged: (String? value) {
                            controller.chosenCountry.value = value!;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: WhatsOnYourMindTextField()),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.center,
                        child: Obx(() => controller.isLoading.value
                            ? const Center(
                                child: SpinKitThreeBounce(
                                  color: Colors.black,
                                  // size: 50.0,
                                ),
                              )
                            : SubmitAccountButton())),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
