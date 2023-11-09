import 'package:meta_package/api/api_endpoint/menu_api.dart';
import 'package:meta_package/api/models/home/menu_model.dart';

class MenuAPIRepository {
  String baseUrl;

  MenuAPIRepository({required this.baseUrl});

  late MenuApi baseApi = MenuApi(baseUrl: baseUrl);

  Future<MenuModel> getMenuAPIResponse() async {
    return await baseApi.getMenuResponseProvider();
  }

  Future<MenuModel> getMenuAPISearchResponse() async {
    return await baseApi.getMenuSearchResponseProvider();
  }
}
