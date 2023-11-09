import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/cart/config_cart_item_model.dart';
import 'package:meta_package/api/models/cart/configurable_cart_item.dart';
import 'package:meta_package/api/models/cart/simple_cart_item.dart';
import 'package:meta_package/api/models/cart/simple_cart_item_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';

class CartService {
  final RecommendedProductApi recommendedProductApi;
  final CartApi cartApi;

  CartService(this.recommendedProductApi, this.cartApi);

  Future<CartModel> getCart(String currency) async {
    LocalStore.localStore.getGuestToken();
    LocalStore.localStore.checkGuest();
    if (LocalStore.localStore.isGuest) {
      CartModel res;
      try {
        res = await cartApi.cartGuestGetDataProvider(currentCurrency: currency);
      } catch (e) {
        String cartId = await recommendedProductApi
            .getGenerateGuestCartApiResponseProvider();
        await LocalStore.setPrefStringValue(
          kStorageConstGuestauthToken,
          (cartId).replaceAll('"', ''),
        );
        LocalStore.localStore.getGuestToken();
        res = await cartApi.cartGuestGetDataProvider(currentCurrency: currency);
      }
      return res;
    } else {
      return await cartApi.cartUserGetDataProvider(currentCurrency: currency);
    }
  }

  Future<String> generateCart(
      ProductItem productItem, List<SizeModel> sizeList) async {
    if (LocalStore.localStore.customerToken == "") {
      await generateGuestCart(productItem, sizeList);
      return LocalStore.localStore.guestToken;
    } else {
      String data =
          await recommendedProductApi.getGenerateUserCartApiResponseProvider();
      if (data.isNotEmpty) {
        await postCart(
            productItem: productItem,
            sizeList: sizeList,
            token: data,
            isGuest: false);
        return data;
      }
      return "";
    }
  }

  Future<void> generateGuestCart(
      ProductItem productItem, List<SizeModel> sizeList) async {
    LocalStore.localStore.getGuestToken();
    if (LocalStore.localStore.guestToken.isNotEmpty) {
      await postCart(
          productItem: productItem,
          sizeList: sizeList,
          token: LocalStore.localStore.guestToken,
          isGuest: true);
    } else {
      String data =
          await recommendedProductApi.getGenerateGuestCartApiResponseProvider();
      if (data.isNotEmpty) {
        await LocalStore.setPrefStringValue(
          kStorageConstGuestauthToken,
          (data).replaceAll('"', ''),
        );
        LocalStore.localStore.getGuestToken();
        await postCart(
            productItem: productItem,
            sizeList: sizeList,
            token: LocalStore.localStore.guestToken,
            isGuest: true);
      }
    }
  }

  Future<void> postCart(
      {required ProductItem productItem,
      required List<SizeModel> sizeList,
      required String token,
      required bool isGuest}) async {
    if (sizeList.isEmpty ||
        productItem.typeId != kCartItemModelConfigurableProductTypeKey) {
      var item = SimpleCartItemModel(productItem.sku!, 1, token);
      // passedAddToCart = {kCartItemModelCartItemKey: item.toJson()};
      if (isGuest) {
        await recommendedProductApi.guestPostAddTOCartProductProvider(
            body: SimpleCartItem(item));
      } else {
        await recommendedProductApi.postAddTOCartProductProvider(
            body: SimpleCartItem(item));
      }
    } else {
      var confOptionId = productItem.extensionAttributes
              ?.configurableProductOptions?.first.attributeId
              .toString() ??
          '';
      var confOptionValue = (productItem.extensionAttributes
                  ?.configurableProductOptions?.first.values?.isEmpty ??
              false)
          ? "0"
          : (sizeList.first.value ?? '').toString();
      var item = ConfigurableCartItemModel(
          productItem.sku!,
          1,
          token,
          ProductOption(
              extensionAttributes:
                  ProductOptionExtensionAttributes(configurableItemOptions: [
            ConfigurableItemOption(
                optionId: confOptionId,
                optionValue: int.tryParse(confOptionValue))
          ])));

      if (isGuest) {
        await recommendedProductApi.guestPostAddTOCartProductProvider(
            body: ConfigurableCartItem(item));
      } else {
        await recommendedProductApi.postAddTOCartProductProvider(
            body: ConfigurableCartItem(item));
      }
    }
  }
}
