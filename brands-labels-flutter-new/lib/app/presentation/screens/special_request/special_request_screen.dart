import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/controller/special_request_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  const SpecialRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: buttonColor,
        ),
        title:
            CommonTextPoppins(controller.getHeaderString(), color: buttonColor),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
            ),
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(24.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      nameTextField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      lastNameField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      emailField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      phoneNumberField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      brandNameField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      styleField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      keywordField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      imageUrlField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      remarkField(),
                      SizedBox(
                        height: 30.h,
                      ),
                      submitAccountButton(
                        context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: appBarPrimary,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget nameTextField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.nameController,
              hintText: LanguageConstants.firstNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                controller.nameController.text == "" && controller.isValidation
                    ? LanguageConstants.firstNameIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget lastNameField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.lastNameController,
              hintText: LanguageConstants.lastNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                controller.lastNameController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.lastNameIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget emailField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.emailController,
              hintText: LanguageConstants.emailAddreessText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                return controller.emailController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.emailRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget phoneNumberField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: CommonTextPhoneField(
              borderRadius: BorderRadius.circular(12),
              textController: controller.phoneNumberController,
              cursorColor: regularGrey,
              dropdownIconColor: Colors.grey.shade500,
              borderColor: Colors.grey.shade400,
              focusedColor: Colors.grey.shade400,
              country: Get.find<CountryController>().country.value,
              dropdownTextStyle: AppTextStyle.textStyleUtils400(),
              fontStyle: AppTextStyle.textStyleUtils400(),
              hintStyle: AppTextStyle.textStyleUtils400(color: regularGrey),
              hintText: LanguageConstants.phoneNumberText.tr,
              validator: (value) {
                return controller.phoneNumberController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.phoneNumberIsRequired.tr
                    : null;
              },
              onCountryChanged: (country) {
                controller.countryCode = country.dialCode;
              },
            ),
          );
        });
  }

  Widget brandNameField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.brandNameController,
              hintText: LanguageConstants.brandName.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                return controller.brandNameController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.brandNameIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget styleField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.styleController,
              hintText: LanguageConstants.style.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                return controller.styleController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.styleIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget keywordField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.keywordController,
              hintText: LanguageConstants.keyword.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                return controller.keywordController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.keywordIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget imageUrlField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLength: 70,
              maxLines: 1,
              controller: controller.imageUrlController,
              hintText: LanguageConstants.imageURL.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                return controller.imageUrlController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.imageUrlIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget remarkField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.remarkController,
              hintText: LanguageConstants.remark.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) {
                return controller.remarkController.text == "" &&
                        controller.isValidation
                    ? LanguageConstants.remarkIsRequired.tr
                    : null;
              },
            ),
          );
        });
  }

  Widget submitAccountButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        child: CommonThemeButton(
          onTap: () {
            controller.contactUsPost(context);
          },
          title: LanguageConstants.submitText.tr,
        ),
      ),
    );
  }
}
