import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:suvandnat/app/controller/contact_us/contact_us_controller.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  final ContactUsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonBacground(
          child: Scaffold(
            key: controller.scaffoldKey.value,
            backgroundColor: Colors.transparent,
            appBar: commonAppbar(title: LanguageConstants.contactUsText.tr),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.5),
                  child: GetBuilder<ContactUsController>(
                    id: "Contact",
                    builder: (controller) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                              LanguageConstants
                                  .whateverYourQueryUseTheContactFormBelowMsg
                                  .tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54, size: 12.5)
                                  .copyWith(height: 1.4)),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormFieldWidget(
                              controller: controller.nameController,
                              hintText: controller.isValidation &&
                                      controller.onyourmindController.text == ""
                                  ? LanguageConstants.enterFirstName.tr
                                  : LanguageConstants.firstNameText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) => Validators.validateName(
                                  value?.trim(),
                                  message: LanguageConstants.firstNameText.tr),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            child: TextFormFieldWidget(
                              controller: controller.surnameController,
                              hintText: controller.isValidation &&
                                      controller.surnameController.text == ""
                                  ? LanguageConstants.enterSurName.tr
                                  : LanguageConstants.surNameTextsuv.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) => Validators.validateName(
                                  value?.trim(),
                                  message: LanguageConstants.surNameTextsuv.tr),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            child: EmailWidget(
                              controller: controller.emailController,
                              hintText: LanguageConstants.emailText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) =>
                                  Validators.validateEmail(value ?? ''),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: CommonTextPhoneField(
                                  textController: controller.phoneController,
                                  cursorColor: blue,
                                  fillColor: whiteColor,
                                  filled: true,
                                  dropdownIconColor: borderGrey,
                                  country: Get.find<CountryController>()
                                      .country
                                      .value,
                                  borderColor: borderGrey,
                                  focusedColor: borderGrey,
                                  dropdownTextStyle:
                                      AppTextStyle.textStyleUtils400_12(),
                                  fontStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black, size: 14.sp),
                                  hintStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.grey, size: 14.sp),
                                  hintText:
                                      LanguageConstants.phoneNumberText.tr,
                                  onCountryChanged: (country) {
                                    controller.countryCode = country.dialCode;
                                  },
                                  validator: (value) =>
                                      Validators.validateMobile(
                                          value?.number ?? ''),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            child: TextFormFieldWidget(
                              controller: controller.subjectController,
                              hintText: LanguageConstants.subjectTextsuv.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) => Validators.validateRequired(
                                  value ?? '',
                                  LanguageConstants.subjectTextsuv.tr),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Obx(() => Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: borderGrey, width: 2),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    dropdownColor: appColorAccent,
                                    icon: const Icon(Icons.expand_more_outlined,
                                        color: appColor),
                                    value: controller.chosenValue.value,
                                    elevation: 2,
                                    items: controller.data
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: AppTextStyle.textStyleUtils400(
                                            color: blackColor,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      LanguageConstants.typeOfEnquiryTextsuv.tr,
                                      style: AppTextStyle.textStyleUtils400(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      controller.chosenValue.value = value!;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(height: 12),
                          Obx(() => Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: borderGrey, width: 2),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    dropdownColor: appColorAccent,
                                    icon: const Icon(Icons.expand_more_outlined,
                                        color: appColor),
                                    value: controller.chosenCountry.value,
                                    elevation: 2,
                                    style: AppTextStyle.textStyleUtils400(),
                                    items: controller
                                        .countryController.storeWebsitesList
                                        .map((item) {
                                      return DropdownMenuItem(
                                          child: Text(
                                            item.name ?? '',
                                            style:
                                                AppTextStyle.textStyleUtils400(
                                              color: blackColor,
                                            ),
                                          ),
                                          value: item.name.toString());
                                    }).toList(),
                                    hint: Text(LanguageConstants.countryText.tr,
                                        style:
                                            AppTextStyle.textStyleUtils400()),
                                    onChanged: (String? value) {
                                      controller.chosenCountry.value = value!;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(height: 12),
                          SizedBox(
                            child: TextFormFieldWidget(
                              controller: controller.onyourmindController,
                              maxLines: 5,
                              isPaded: 15,
                              hintText:
                                  LanguageConstants.whatsonyourmindText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) => Validators.validateRequired(
                                  value ?? '',
                                  LanguageConstants.whatsonyourmindText.tr),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Obx(() => controller.isLoading.value
                              ? const Center(
                                  child: SpinKitThreeBounce(
                                      color: appColorPrimary),
                                )
                              : CommonThemeButton(
                                  onTap: () {
                                    controller.isValidation = true;
                                    controller.update(["Contact"]);
                                    controller.contactUsPost(context);
                                  },
                                  title: LanguageConstants.submitText.tr,
                                )),
                          const SizedBox(height: 30),
                          Text(
                            LanguageConstants.headOffice.tr,
                            style: AppTextStyle.textStyleUtils400(
                              size: 16.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            LanguageConstants.suvandnutAddress.tr,
                            style: AppTextStyle.textStyleUtils400(
                              size: 13,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            LanguageConstants.officeAddrLine2.tr,
                            style: AppTextStyle.textStyleUtils400(
                              size: 13,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'customercare@suvandnut.com',
                            style: AppTextStyle.textStyleUtils400(size: 12.5)
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                          const SizedBox(height: 25),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
