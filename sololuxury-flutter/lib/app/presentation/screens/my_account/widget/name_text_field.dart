import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class NameTextField extends GetView<MyAccountController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.firstNameController,
      hintText: LanguageConstants.nameChatText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateName(
        value?.trim(),
      ),
      textStyle: const TextStyle(color: Colors.black),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    );
  }
}
