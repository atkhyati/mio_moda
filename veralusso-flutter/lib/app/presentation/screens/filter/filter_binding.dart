import 'package:get/get.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:veralusso/app/controller/filter/filter_controller.dart';

import '../../../controller/product_listing/product_controller.dart';
import '../../../core/const/app_constants.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
    Get.lazyPut(() => ProductController( CartGenerateAddRepository(
      CartService(
          RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
          CartApi(
            baseUrl: AppConstants.apiEndPointLogin,
          )),
    ),));
  }
}
