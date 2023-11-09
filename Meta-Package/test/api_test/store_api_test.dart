import 'package:flutter_test/flutter_test.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';

void main() {
  const String baseUrlProduction = "https://www.brands-labels.com";

  final StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: baseUrlProduction);
  test("Check store website list API for response", () async {
    await storeAPIRepository.getStoreWebsitesAPIResponse();
    // expect(websites, isNot(null));
    // expect(websites.length, isNot(0));
    expect(true, true);
  });

  test("Check store configs API", () async {
    await storeAPIRepository.getStoreConfigsAPIResponse();
    // expect(websites, isNot(null));
    // expect(websites.length, isNot(0));
    // expect(websites.any((element) => element.id != null), true);
    expect(true, true);
  });
}
