import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/models/newsletter/newsletter_request.dart';

import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class NewsLetterScreen extends StatelessWidget {
  NewsLetterScreen({Key? key}) : super(key: key);
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  RxBool isLoading = false.obs;
  RxBool isEmailSelected = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appColorAccent,
        title: Text(
          LanguageConstants.myAccountText.tr,
          style: AppTextStyle.textStyleUtils700(color: appColorButton),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          // Center(
          //   child: Text(
          //     LanguageConstants.myAccountText.tr,
          //     style: AppTextStyle.textStyleUtils700(color: appColorButton),
          //   ),
          // ),
          // const SizedBox(
          //   height: 70,
          // ),
          Text(
            LanguageConstants.communicationPreference.tr,
            style: AppStyle.textStyleUtils500(size: 18, color: appColorButton)
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            LanguageConstants.subscribeToBeTheFirstText.tr,
            style: AppStyle.textStyleUtils400(size: 13.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            localStore.userDetail.extensionAttributes!.isSubscribed == true
                ? "Unsubscribe to newsletters."
                : LanguageConstants.subscribeToNewsletters.tr,
            style: AppStyle.textStyleUtils400_12(
                color: Colors.black.withOpacity(0.5)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckBoxContainer(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() => isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: appColor,
                  ),
                )
              : Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appColorButton),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: MaterialButton(
                      onPressed: () {
                        subscribeNewsLetter();
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        LanguageConstants.saveText.tr,
                        style: AppStyle.textStyleUtils400(
                            size: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ))
        ],
      ),
    );
  }

  Widget CheckBoxContainer() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // isEmailSelected.value = !isEmailSelected.value; //Email is mandatory
          },
          child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColorButton,
                  width: 1.5,
                ),
              ),
              child: Obx(
                () => isEmailSelected.value
                    ? const Icon(
                        Icons.check,
                        color: appColorButton,
                        size: 12,
                      )
                    : const SizedBox(),
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          LanguageConstants.email.tr,
          style: AppStyle.textStyleUtils500_12(color: appColorButton),
        )
      ],
    );
  }

  Future<void> subscribeNewsLetter() async {
    isLoading.value = true;
    try {
      var userEmail = isEmailSelected.value ? localStore.userDetail.email : '';

      if (localStore.customerToken == "") {
        await newsletterAPIRepository.subscribeNewsLetter(email: userEmail);
      } else {
        await newsletterAPIRepository.subscribeNewsletterProviderUser(
            NewsletterRequestModel(
                customer: Customer1(
                    email: localStore.userDetail.email,
                    firstname: localStore.userDetail.firstname,
                    id: localStore.userDetail.id,
                    lastname: localStore.userDetail.lastname,
                    store_id: localStore.userDetail.storeId,
                    redExtensionAttributes:
                        RequestExtAttribute(is_subscribed: true).toJson(),
                    website_id: localStore.userDetail.websiteId)));
      }
      localStore.userDetail.extensionAttributes!.isSubscribed = true;
      Get.back();
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
}
