import 'dart:developer';

import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/models/guest_order_track/guest_order_track.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/meta_package.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../core/consts/app_constants.dart';
import '../../../core/utils/app_routes.dart';
import '../../common_widgets/common_widget/common_message/validator.dart';
import '../track_your_order/track_your_nofounddata_screen.dart';

class GuestReturnsScreen extends StatefulWidget {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  State<GuestReturnsScreen> createState() => _GuestReturnsScreenState();
}

class _GuestReturnsScreenState extends State<GuestReturnsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController subscribeEmailController = TextEditingController();
  TextEditingController orderIdController = TextEditingController();
  TextEditingController billingLastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  final TrackYourOrderAPIRepository trackYourOrderAPIRepository =
      TrackYourOrderAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  Rx<MyOrdersDataItem> myOrdersItems = MyOrdersDataItem().obs;
  RxBool isOrderLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppbar(
          title: LanguageConstants.trackOrderText.tr,
        ),
        backgroundColor: appBGColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CommonTextPoppins(
                    LanguageConstants.guestUser.tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.w),
                CommonTextField(
                    controller: orderIdController,
                    hintText: LanguageConstants.orderIdText.tr,
                    validator: (value) =>
                        Validators.validateNumber(orderIdController.text),
                    isValidationShow: false),
                SizedBox(height: 20.w),
                CommonTextField(
                    controller: billingLastnameController,
                    hintText: LanguageConstants.billingLastName.tr,
                    validator: (value) =>
                        Validators.validateName(billingLastnameController.text),
                    isValidationShow: false),
                SizedBox(height: 40.w),
                Align(
                    alignment: Alignment.centerLeft,
                    child: CommonTextPoppins(
                      LanguageConstants.findOrderby.tr,
                      fontSize: 14.sp,
                    )),
                SizedBox(height: 20.w),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  // padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                      controller: emailController,
                      validator: (value) => Validators.validateEmail(
                            value?.trim(),
                          ),
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppConstants.fontPoppins),
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: borderGrey, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: borderGrey, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: borderGrey, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: borderGrey, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: borderGrey, width: 2)),
                        // contentPadding: EdgeInsets.zero,
                        hintText: LanguageConstants.email.tr,
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: grey636363,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppConstants.fontPoppins),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100), // for mobile
                      ]),
                ),
                SizedBox(height: 40.w),
                SizedBox(
                  child: Obx(
                    () => isOrderLoading.value
                        ? const Center(
                            child: SpinKitThreeBounce(
                            color: appBorderColor,
                          ))
                        : Center(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonThemeButton(
                                  onTap: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      getGuestTrackYourOrder();
                                    }
                                  },
                                  title: LanguageConstants.letsGoText.tr),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 40.w),
                Text(
                  LanguageConstants.subsubcribeText.tr,
                  style: AppTextStyle.textStyleUtils500(size: 14.sp),
                ),
                SizedBox(height: 20.w),
                Text(
                  LanguageConstants.getAllTheLatestText.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(size: 12.sp),
                ),
                SizedBox(height: 40.w),
                Form(
                  key: formKey1,
                  child: Column(
                    children: [
                      SizedBox(
                        child: CommonTextField(
                          controller: subscribeEmailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: LanguageConstants.enterEmailAddress.tr,
                          validator: (value) => Validators.validateEmail(
                            value?.trim(),
                          ),
                        ),
                      ),
                      Obx(() => isLoading.value
                          ? const Center(
                              child: SpinKitThreeBounce(
                              color: Color(0xff367587),
                              // size: 50.0,
                            ))
                          : const SizedBox())
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: CommonThemeButton(
                      onTap: () {
                        if (formKey1.currentState?.validate() ?? false) {
                          subscribeNewsLetter(subscribeEmailController.text);
                        }
                      },
                      title: LanguageConstants.specialSizeSubscribeText.tr),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ));
  }

  Future<void> subscribeNewsLetter(String email) async {
    isLoading.value = true;
    try {
      final response =
          await newsletterAPIRepository.subscribeNewsLetter(email: email);
      if (response.message != null && response.message != '') {
        subscribeEmailController.text = "";
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CommonTextPoppins(
              response.message.toString(),
            ),
          ),
        );
      }
      log('', name: "Value");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
    isLoading.value = false;
  }

  Future<void> getGuestTrackYourOrder() async {
    // isValid.value = true;
    isOrderLoading.value = true;
    debugPrint("Get getTrackYourOrder ===>");
    // update(["forms"]);
    try {
      if (orderIdController.value.text != "") {
        MyOrdersDataItem itemsData = await trackYourOrderAPIRepository
            .getGuestTrackYourOrderApiResponse(GuestOrderForm(GuestOrderRequest(
                    orderId: orderIdController.text,
                    billingLastName: billingLastnameController.text,
                    type: "email",
                    email: emailController.text)
                .toJson()));

        myOrdersItems.value = itemsData;

        if (myOrdersItems.value.incrementId != null) {
          Get.toNamed<dynamic>(RoutesConstants.orderDetailsScreen,
              arguments: ['', myOrdersItems.value]);
        } else {
          Get.to<dynamic>(() => const TrackYourRequestNegative());
        }
        orderIdController.clear();
        isOrderLoading.value = false;
        // update(["forms"]);
      }
    } on ApiException catch (e) {
      errorToast(
          LanguageConstants.weCannotFindAnyOrdersAssociatedWithThisEmail.tr);
      isOrderLoading.value = false;
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to<dynamic>(() => const TrackYourRequestNegative());
          });
    } catch (e) {
      isOrderLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}
