import 'package:avoirchic/app/controller/influencer_registration_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:avoirchic/app/presentation/screens/influencer_registraction/widgets/influencer_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';
import '../../../theme/colors.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  const InfluencerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title:
          LanguageConstants.influencerRegistrationText.tr,
          
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          InfluencerDesign(),
        ],
      ),
    );
  }



}
