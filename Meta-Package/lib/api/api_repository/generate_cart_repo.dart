import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/services/cart_service.dart';

class CartGenerateAddRepository {
  final CartService cartService;

  CartGenerateAddRepository(this.cartService);

  Future<String> addtoCart(ProductItem item, List<SizeModel> sizeList) async {
    return await cartService.generateCart(item, sizeList);
  }
}
