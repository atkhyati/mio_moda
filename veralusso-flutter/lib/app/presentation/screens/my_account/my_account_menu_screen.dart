import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:livechatt/livechatt.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/my_account/my_account_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/data/local_data/local_store.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/presentation/screens/about_us/about_us_screen.dart';
import 'package:veralusso/app/presentation/screens/my_account/widgets/account_menu_field.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  @override
  final MyAccountController controller = Get.find();

  MyAccountMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(color: blackColor),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.accountDetail?.value.firstname != null &&
                          localStore.customerToken.toString() != "")
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 13.w),
                          child: Row(
                            children: [
                              Text(
                                LanguageConstants.helloText.tr,
                                style: AppTextStyle.textStyleUtils500_20(),
                              ),
                              Text(
                                controller.accountDetail?.value.firstname ?? '',
                                style: AppTextStyle.textStyleUtils600_20(),
                              ),
                            ],
                          ),
                        ),
                      if (controller.accountDetail?.value.email?.isNotEmpty ==
                              true &&
                          localStore.customerToken.toString() != "")
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, bottom: 13.w),
                          child: Text(
                            controller.accountDetail?.value.email ?? '',
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                        ),
                      // const MyAccountHeader(),
                      localStore.customerToken.toString() != ""
                          ? Container(
                              height: 44.h,
                              color: profileTileBG,
                              child: Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CommonTextPoppins(
                                    LanguageConstants.myAccount.tr,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 30),
                                child: Column(
                                  children: [
                                    Text(
                                      LanguageConstants
                                          .accessYourAccountDetailsText.tr,
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonThemeButton(
                                          isOutLined: true,
                                          buttonColor: whiteColor,
                                          textColor: blackColor,
                                          onTap: () {
                                            Get.toNamed(
                                              RoutesConstants.signupScreen,
                                              arguments: [
                                                0,
                                                MyAccountDetails(),
                                              ],
                                            );
                                          },
                                          title:
                                              LanguageConstants.signUpText.tr,
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        CommonThemeButton(
                                          onTap: () {
                                            Get.toNamed(
                                                RoutesConstants.loginScreen);
                                          },
                                          title: LanguageConstants
                                              .loginMyAccountText.tr,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () async {
                                          Get.toNamed(
                                              RoutesConstants.myOrderScreen);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                              LanguageConstants.myOrderText.tr,
                                              style: AppTextStyle
                                                  .textStyleUtils400_16()),
                                        ),
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? Divider(
                                        color: Colors.grey.shade100,
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesConstants.wishlistScreen);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            LanguageConstants.myWishlistText.tr,
                                            style: AppTextStyle
                                                .textStyleUtils400_16(),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? Divider(
                                        color: Colors.grey.shade100,
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesConstants.myAddress);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            LanguageConstants
                                                .addressBookText.tr,
                                            style: AppTextStyle
                                                .textStyleUtils400_16(),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? Divider(
                                        color: Colors.grey.shade100,
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RoutesConstants
                                              .myAccountScreenScreen);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            LanguageConstants
                                                .accountInformationText.tr,
                                            style: AppTextStyle
                                                .textStyleUtils400_16(),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? Divider(
                                        color: Colors.grey.shade100,
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesConstants.myTickets);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            LanguageConstants.myTicketsText.tr,
                                            style: AppTextStyle
                                                .textStyleUtils400_16(),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? Divider(
                                        color: Colors.grey.shade100,
                                      )
                                    : Container(),
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesConstants.myOrderScreen);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            LanguageConstants.trackOrderText.tr,
                                            style: AppTextStyle
                                                .textStyleUtils400_16(),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                Divider(
                                  color: Colors.grey.shade100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RoutesConstants.countryScreen);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      controller.countryCurrency.value,
                                      style:
                                          AppTextStyle.textStyleUtils400_16(),
                                    ),
                                  ),
                                ),
                                localStore.customerToken.toString() != ""
                                    ? Divider(
                                        color: Colors.grey.shade100,
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.companyText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  RoutesConstants.returnsAndRefundsScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.returnsText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.referFriendScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.referFriendMyAccountText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.charityScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.helpTheNeedyText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          // Divider(
                          //   color: Colors.grey.shade100,
                          // ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //         left: 24.w, top: 10.h, bottom: 10.h),
                          //     child: Align(
                          //       alignment: Alignment.centerLeft,
                          //       child: CommonTextPoppins(
                          //         LanguageConstants.secureShoppingText.tr,
                          //         fontSize: 16.14,
                          //         color: blackColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RoutesConstants.traceYourTicketMail,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.trackYourTicketByEmail.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RoutesConstants.guestReturnScreen,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  firstCapitalize(
                                      LanguageConstants.trackOrderGuest.tr),
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RoutesConstants.shippingScreen,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.shippingText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.socialText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  RoutesConstants.influencerRegistrationScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants
                                      .influencerRegistrationText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  RoutesConstants.affiliateProgramScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.affiliateText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.toNamed(RoutesConstants.productListScreen);
                          //   },
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //         left: 24.w, top: 10.h, bottom: 10.h),
                          //     child: Align(
                          //       alignment: Alignment.centerLeft,
                          //       child: CommonTextPoppins(
                          //         LanguageConstants.advancedSearchText.tr,
                          //         fontSize: 16.14,
                          //         color: blackColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Divider(
                          //   color: Colors.grey.shade100,
                          // ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.aboutText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AboutUsScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.aboutUsText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.termsConditionScreen);
                              // Get.to(() => const TermsAndConditionScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.termsConditionsText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.privacyPolicyScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.privacyPolicyText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.contactUsScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.contactUsText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.faqScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.faqMyAccountText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              showTitleDialog1(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.liveChatText.tr,
                                  fontSize: 16.14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          localStore.customerToken.toString() == ""
                              ? Container()
                              : Divider(
                                  color: Colors.grey.shade100,
                                ),
                          localStore.customerToken.toString() == ""
                              ? Container()
                              : GestureDetector(
                                  onTap: () async {
                                    showConfirmationDialog(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.w, top: 10.h, bottom: 10.h),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CommonTextPoppins(
                                        LanguageConstants.logOutText.tr,
                                        fontSize: 16.14,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      )
                    ],
                  ),
                ),
        ));
  }

  String firstCapitalize(String name) {
    return name.split(" ").map((str) => str.capitalize).join(" ");
  }

  Future showConfirmationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: Colors.white,
            contentWidget: Stack(
              // overflow: Overflow.visible,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        LanguageConstants.areYouSureToLogOut.tr,
                        style: AppTextStyle.textStyleUtils500_16(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonThemeButton(
                            title: LanguageConstants.yesText.tr,
                            onTap: () async {
                              await LocalStore.removePrefValue(
                                kStorageConstAuthToken,
                              );
                              await LocalStore.removePrefValue(
                                localStore.customerToken,
                              );
                              await LocalStore.removePrefValue(
                                kStorageConstAuthToken,
                              );
                              localStore.customerToken = "";
                              LocalStore().checkGuest();
                              Get.deleteAll();
                              Get.offAllNamed(
                                RoutesConstants.logoutSuccess,
                              );
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CommonThemeButton(
                            title: LanguageConstants.no.tr,
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future showTitleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            titleWidget: Form(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LanguageConstants.firstNameText.tr,
                      style: const TextStyle(
                        fontFamily: AppConstants.fontMontserrat,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  NameTextField(),
                  const SizedBox(height: 7.5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LanguageConstants.emailText.tr,
                      style: const TextStyle(
                        fontFamily: AppConstants.fontMontserrat,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  EmailTextField(),
                ],
              ),
            ),
            actionWidgets: <Widget>[
              TextButton(
                onPressed: () {
                  Livechat.beginChat(
                      AppConstants.licenceId,
                      '1',
                      controller.firstNameController.value.text.trim(),
                      controller.emailController.value.text.trim());
                },
                child: Text(LanguageConstants.startChatText.tr),
              ),
            ],
            contentWidget: const SizedBox.shrink(),
          );
        });
  }

  Future showTitleDialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          backgroundColor: whiteColor,
          insetPadding: const EdgeInsets.all(15),
          contentWidget: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: -40.0,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: Image.asset(
                    AppAsset.account,
                    color: Colors.white,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              GetBuilder<MyAccountController>(
                id: "MyAccount",
                builder: (controller) {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 75,
                          margin: const EdgeInsets.only(top: 50),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  LanguageConstants.welcometoChatText.tr,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Center(
                                child: Text(
                                  LanguageConstants.fillTheFormText.tr,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Column(
                            children: [
                              NameTextField(),
                              const SizedBox(
                                height: 10,
                              ),
                              EmailTextField(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 45.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.isValid = true;
                                controller.update(["MyAccount"]);
                                if (controller.validation()) {
                                  if (controller.emailController.value.text !=
                                          "" &&
                                      controller
                                              .firstNameController.value.text !=
                                          "") {
                                    Livechat.beginChat(
                                      AppConstants.licenceId,
                                      '1',
                                      controller.firstNameController.value.text
                                          .trim(),
                                      controller.emailController.value.text
                                          .trim(),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: blackColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                LanguageConstants.startChatText.tr,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppConstants.fontMontserrat,
                                    color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
