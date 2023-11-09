import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../../all_imports.dart';

class StartChatButton extends GetView<MyOrdersController> {
  const StartChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          if (controller.formKey.currentState?.validate() ?? false) {
            controller.clickChatEvent(
                name: controller.firstNameController.value.text.trim(),
                email: controller.emailController.value.text.trim());
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
        ),
        child: Text(
          LanguageConstants.startChatText.tr,
          style: AppStyle.textStyleUtils400(color: Colors.white),
        ),
      ),
    );
  }
}
