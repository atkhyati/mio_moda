// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/product_api.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/api_repository/product_list_api_repository.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart'
    as my_account;
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/utils/global_singlton.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/data/local_data/local_store.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_binding.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_dialog.dart';

class ProductController extends GetxController {
  RxString productId = "".obs;
  bool isSearch = false;
  RxInt selectedSortIndex = 0.obs;
  Rx<SortValue> selectedSortVal = SortValue("Relevance", "DESC").obs;
  RxList<SortValue> sortTypeList = <SortValue>[
    SortValue("Relevance", "DESC"),
    SortValue("New Arrivals", "DESC"),
    SortValue("Price (highest first)", "DESC"),
    SortValue("Price (lowest first)", "ASC"),
    SortValue("Discount (highest first)", "DESC"),
    SortValue("Discount (lowest first)", "ASC"),
  ].obs;

  List<List<bool>> dotsList = [];
  List<List<String>> productImageList = [];
  RxBool visibleLoader = false.obs;
  RxList<SizeModel> chooseOption = RxList([]);
  RxList<SizeModel> listOfChoose = RxList([]);
  RxList<SizeModel> sizeList = RxList([]);
  RxBool dropdownValidator = false.obs;
  RxBool dialogLoader = false.obs;
  String? argument;

  RxList<RecommendedProductModel> recommendationList = RxList([]);
  Rx<ProductModel>? productModel = ProductModel().obs;
  RxList<ProductItem> itemList = <ProductItem>[].obs;

  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final ProductListAPIRepository productListAPIRepository =
      ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final CartGenerateAddRepository cartGenerateAddRepository;

  ProductController(this.cartGenerateAddRepository);

  RxBool isLoading = true.obs;

  RxBool isFilter = false.obs;

  RxInt currentCategoryIndex = 0.obs;

  Rx<FilterModel> filterModel = FilterModel().obs;
  RxList<FilterModel> filterModelList = <FilterModel>[].obs;
  RxList<FilterModel> saveFilterModelList = <FilterModel>[].obs;
  RxList<Category> subCategoryList = <Category>[].obs;
  RxList<Category> saveSubCategoryList = <Category>[].obs;
  TextEditingController searchEditingController = TextEditingController();
  RxMap<String, List> selectedMap = <String, List>{}.obs;
  Rx<FilterModel> selectedCategory = FilterModel().obs;
  RangeValues currentRangeValues = const RangeValues(20, 60);
  List<Category>? data = [];

  RxString id = "".obs;
  RxString title = "".obs;
  my_account.MyAccountDetails userDetail = my_account.MyAccountDetails();
  RxInt productCount = 0.obs;
  RxInt currentPage = 1.obs;
  RxBool productLoading = false.obs;
  RxBool productIsEnded = false.obs;
  bool isAlreadyScrolled = false;
  RxBool isNullable = false.obs;
  RxString erroMessage = "".obs;
  RxBool fromSorting = false.obs;
  RxBool fromFilter = false.obs;
  GlobalKey<ScaffoldState> filterScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<void> onInit() async {
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    if (Get.arguments[0].toString() == "brand") {
      productId.value = Get.arguments[1].toString();
      getHomeProducts(Get.arguments[1].toString(), true);
    } else {
      productId.value = Get.arguments[1].toString();
      getHomeProducts(Get.arguments[1].toString(), false);
    }
    argument = Get.arguments[0].toString();
    id.value = Get.arguments[1].toString();
    title.value = Get.arguments[2].toString();
    ProductDetailsBindings().dependencies();
    getSizeApiRes();
    getFilterData();
    super.onInit();
  }

  Future<void> getSizeApiRes() async {
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      chooseOption.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  void checkUncheckOptions(List<Category>? childCategory2, int i) {
    childCategory2![i].isSelected.value = !childCategory2[i].isSelected.value;
    if (childCategory2[i].isSelected.value) {
      selectedMap.containsKey(selectedCategory.value.attrCode)
          ? selectedMap.update(
              selectedCategory.value.attrCode!,
              (value) {
                List tempVal = value;
                // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                value.contains(childCategory2[i].value)
                    ? tempVal.remove(childCategory2[i].value)
                    : tempVal.add(childCategory2[i].value);
                return tempVal;
              },
            )
          : selectedMap.addAll(
              {
                selectedCategory.value.attrCode!: [childCategory2[i].value]
              },
            );
    } else {
      selectedMap.containsKey(selectedCategory.value.attrCode)
          ? selectedMap.update(
              selectedCategory.value.attrCode!,
              (value) {
                List tempVal = value;
                value.contains(childCategory2[i].value)
                    ? tempVal.remove(childCategory2[i].value)
                    : tempVal.add(childCategory2[i].value);
                return tempVal;
              },
            )
          : selectedMap.addAll(
              {
                selectedCategory.value.attrCode!: [childCategory2[i].value]
              },
            );
    }
  }

  Future<void> getHomeProducts(String val, bool isBrand) async {
    if (currentPage.value == 1) isLoading.value = true;

    if (currentPage.value == 1) await getOptionsFromAPI();
    try {
      ProductModel productModelData =
          await productListAPIRepository.getProductListApiResponse(
        val,
        isBrand,
        currentPage: currentPage.value,
        pageSize: 20,
      );
      productModel?.value = productModelData;
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);

      isLoading.value = false;
      isAlreadyScrolled = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        isLoading.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getSortedProducts() async {
    fromSorting.value = true;
    fromFilter.value = false;
    if (currentPage.value == 1) isLoading.value = true;
    productLoading.value = true;
    if (currentPage.value == 1) await getOptionsFromAPI();
    try {
      ProductModel data =
          await productListAPIRepository.getSortedProductListApiResponse(
        "$productId${ProductApi.sortedProductListEndPoint}${selectedSortVal.value.value!}",
        currentPage: currentPage.value,
        pageSize: 20,
      );
      productModel?.value = data;
      // itemList.clear();
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);
      productLoading.value = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        productLoading.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void resetValue() {
    currentPage.value = 1;
    itemList.clear();
    productCount = 0.obs;
  }

  void fillValueInDotsList(RxList<ProductItem> itemList) {
    dotsList = [];
    productImageList = [];
    for (ProductItem item in itemList) {
      List<String> tempImg = [];
      if (item.mediaGalleryEntries != null) {
        List<MediaGalleryEntry> tempList = item.mediaGalleryEntries!
            .where((element) => element.mediaType == "image")
            .toList();

        for (var element in tempList) {
          if (element.file != null) {
            tempImg.add(element.file!);
          }
        }

        List<bool> list = List.generate(tempList.length, (index) => false);
        if (list.isNotEmpty) {
          list.first = true;
          dotsList.add(list);
          productImageList.add(tempImg);
        } else {
          dotsList.add(list);
          productImageList.add(tempImg);
        }
      }
    }
  }

  Future<void> getOptionsFromAPI() async {
    try {
      if (GlobalSingleton().optionList.isEmpty) {
        List<dynamic> data =
            await productListAPIRepository.getOptionsListApiResponse();
        if (data.isNotEmpty == true) {
          GlobalSingleton().optionList = data;
        }
      }
      debugPrint("OptionList -> ${GlobalSingleton().optionList.length}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> getFilterData() async {
    try {
      if (Get.arguments != null) {
        List<FilterModel> data = await productListAPIRepository
            .getFilterListApiResponse(Get.arguments[1].toString());
        log('getFilterData Data is:-->>>$data');
        filterModelList.value = data;
        saveFilterModelList = filterModelList;
        filterModel.value = filterModelList.first;
        debugPrint("model -> ${filterModel.value.toJson()}");
        subCategoryList.value = filterModel.value.category ?? <Category>[];
        saveSubCategoryList.value = filterModel.value.category ?? <Category>[];
        selectedCategory.value = filterModel.value;
        int i = filterModelList
            .indexWhere((element) => element.attrCode == 'price');
        log('Index value is $i');
        if (i != -1) {
          currentRangeValues = RangeValues(
              filterModelList[i].minPrice, filterModelList[i].maxPrice);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  void changedData(int index) {
    currentCategoryIndex.value = index;
    searchEditingController.text = "";
    for (int i = 0; i < filterModelList.length; i++) {
      if (i == currentCategoryIndex.value) {
        filterModel.value = filterModelList[i];
        debugPrint("model->${filterModel.value.toJson()}");
        subCategoryList.value = filterModel.value.category!;
        saveSubCategoryList.value = filterModel.value.category!;
      }
    }
  }

  bool productIsInStock(int index) {
    return itemList[index].extensionAttributes != null &&
        itemList[index].extensionAttributes?.stockItem != null &&
        (itemList[index].extensionAttributes?.stockItem?.isInStock ?? false);
  }

  Future<void> getChooseOption(ProductItem item) async {
    visibleLoader.value = true;
    try {
      listOfChoose.value = [];
      sizeList.value = [];

      if (item.extensionAttributes?.configurableProductOptions?.isNotEmpty ??
          false) {
        item.extensionAttributes?.configurableProductOptions?.first.values
            ?.forEach((element) {
          final SizeModel sizeModel = chooseOption.firstWhere((element2) =>
              element.valueIndex.toString() == element2.value.toString());
          listOfChoose.add(sizeModel);
        });
      }
      listOfChoose.add(SizeModel(
          label: LanguageConstants.sizeMissingNotifiedItsBack.tr,
          value: 'Missing'));

      debugPrint("Choose Option Selecte 3 List $listOfChoose");
      await getRecommendedProductDataFromApi(item);
      visibleLoader.value = false;
      debugPrint("Choose Option List 3$chooseOption");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
      visibleLoader.value = false;
    }
  }

  Future<void> getRecommendedProductDataFromApi(ProductItem item) async {
    try {
      List<RecommendedProductModel> data =
          await recommendedProductsAPIRepository
              .getRecommendedProductResponse(item.sku.toString());
      recommendationList.value = data;

      debugPrint(
          "CONTROLLER DATA ==============${recommendationList[0].typeId}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("CONTROLLER DATA ==============$e");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> addToCartPopUPTap(
      ProductItem item, CartController cartController) async {
    try {
      if (item.typeId.toString() == "configurable") {
        if (sizeList.isEmpty) {
          dropdownValidator.value = true;
        } else {
          dropdownValidator.value = false;
          dialogLoader.value = true;
          await addToCart(
              item: item,
              optionId: item.extensionAttributes?.configurableProductOptions
                      ?.first.attributeId ??
                  '',
              optionValue: (item.extensionAttributes?.configurableProductOptions
                          ?.first.values?.isEmpty ==
                      true)
                  ? "0"
                  : (sizeList.first.value ?? '').toString());
          await cartController.fetchCart();
          dialogLoader.value = false;
        }
      } else {
        dropdownValidator.value = false;
        dialogLoader.value = true;
        await addToCart(item: item, optionId: "", optionValue: "");
        await cartController.fetchCart();
        dialogLoader.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> addToCart({
    required ProductItem item,
    required String optionId,
    required String optionValue,
  }) async {
    try {
      String cartID = await cartGenerateAddRepository.addtoCart(item, sizeList);
      debugPrint(cartID);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> recommendationTap(
      int index, CartController cartController) async {
    ProductItem tempProduct = ProductItem(
      id: int.parse(recommendationList[index].productId.toString()),
      sku: recommendationList[index].sku,
    );
    Get.back();
    try {
      ProductItem? tempItem = await getProductDetail(tempProduct);
      if (tempItem != null) {
        Get.toNamed(
          RoutesConstants.productDetailsScreen,
          arguments: [tempItem, argument],
        )?.whenComplete(
          () {
            cartController.getGenerateCart();
          },
        );
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<ProductItem?> getProductDetail(ProductItem item) async {
    visibleLoader.value = true;
    //
    try {
      ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(item.sku.toString());
      visibleLoader.value = false;
      return data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    visibleLoader.value = false;
    return null;
  }

  bool scrollNotificationData(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent &&
        scrollNotification.metrics.axisDirection == AxisDirection.down &&
        !productLoading.value &&
        !productIsEnded.value &&
        !isAlreadyScrolled) {
      if (fromFilter.value) {
        getFilteredProducts();
      } else if (fromSorting.value) {
        getSortedProducts();
      } else {
        isAlreadyScrolled = true;
        getHomeProducts(
          productId.value,
          false,
        );
      }
    }
    return true;
  }

  Future<void> getFilteredProducts() async {
    fromFilter.value = true;
    fromSorting.value = false;
    if (currentPage.value == 1) isLoading.value = true;
    productLoading.value = true;
    if (currentPage.value == 1) await getOptionsFromAPI();
    String url = "";
    selectedMap.forEach((key, value) {
      if (key == "cat") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredCatProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "price") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredPriceProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "size_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredSizeProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "color_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredColorProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "brands") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredBrandProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      }
    });
    url = url +
        AppConstants.filteredPriceProductListEndPointForPriceRangeFrom +
        currentRangeValues.start.toString() +
        AppConstants.filteredPriceFromProductListEndPoint +
        AppConstants.filteredPriceProductListEndPointForPriceRangeTo +
        currentRangeValues.end.toString() +
        AppConstants.filteredPriceToProductListEndPoint;
    debugPrint(url);
    try {
      ProductModel productValue =
          await productListAPIRepository.getFilteredProductListApiResponse(
        "$productId$url",
        currentPage: currentPage.value,
        pageSize: 20,
      );
      productModel?.value = productValue;
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);
      productLoading.value = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        productLoading.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  String productImage(int index) {
    return "${AppConstants.productImageUrl}${productImageList[index].first}";
  }

  Future<void> wishListOnTap({ProductItem? product, int? index}) async {
    try {
      visibleLoader.value = true;

      if (!itemList[index!].isWishList.value) {
        if (localStore.customerToken.isNotEmpty) {
          bool addToWishData = await wishListAPIRepository.addToWishList(
              product?.sku ?? '', localStore.userDetail.email ?? '');
          visibleLoader.value = false;
          itemList[index].isWishList.value = addToWishData;
          ProductDetailDialog.showWishlistDialog(
              Get.context!, product?.name ?? '', productImage(index));
        } else {
          addWishListDataToLocal(product, index);
        }
      } else {
        itemList[index].isWishList.value = false;
        visibleLoader.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      visibleLoader.value = false;
      log(e.toString(), name: "Error");
    }
  }

  Future<void> addWishListDataToLocal(ProductItem? product, int index) async {
    WishListProductModel mainDataObj = WishListProductModel();
    mainDataObj = await localStore.getWishListData();

    log("${mainDataObj.items?.length ?? 0}", name: "wishListData mainDataObj");

    ItemProduct itemProduct = ItemProduct();
    WishlistItem objProduct = WishlistItem();
    ExtensionAttributesProduct extensionAttributes =
        ExtensionAttributesProduct();
    StockItem stockItems = StockItem();
    List<ItemProduct>? lstItemProduct = mainDataObj.items ?? [];
    objProduct.id = product?.id;
    objProduct.sku = product?.sku;
    objProduct.name = product?.name;
    objProduct.attributeSetId = product?.attributeSetId;
    objProduct.price = product?.price;
    objProduct.status = product?.status;
    objProduct.visibility = product?.visibility;
    objProduct.typeId = product?.typeId;
    objProduct.createdAt = product?.createdAt;
    objProduct.updatedAt = product?.updatedAt;
    objProduct.productLinks = product?.productLinks;
    objProduct.tierPrices = product?.tierPrices;
    objProduct.customAttributes = [];
    extensionAttributes.configurableProductOptions = [];
    for (CustomAttributes element in product?.customAttributes ?? []) {
      CustomAttributes customAttribute = CustomAttributes();
      customAttribute.value = element.value.toString();
      customAttribute.attributeCode = element.attributeCode;
      objProduct.customAttributes?.add(customAttribute);
    }

    stockItems = convertStockItem(product?.extensionAttributes?.stockItem);

    extensionAttributes.configurableProductOptions = getConfigurableProduct(
      product?.extensionAttributes?.configurableProductOptions,
    );

    extensionAttributes.convertedRegularOldPrice =
        product?.extensionAttributes?.convertedRegularOldPrice;
    extensionAttributes.convertedRegularPrice =
        product?.extensionAttributes?.convertedRegularPrice;

    extensionAttributes.stockItem = stockItems;
    objProduct.extensionAttributes = extensionAttributes;
    itemProduct.id = product?.id;
    itemProduct.product = objProduct;

    lstItemProduct.add(itemProduct);

    mainDataObj.itemsCount =
        mainDataObj.items == null ? 1 : (mainDataObj.items?.length ?? 0) + 1;
    mainDataObj.items = lstItemProduct;

    await LocalStore.setPrefStringValue(
      kStorageConstWishListData,
      jsonEncode(mainDataObj),
    );
    visibleLoader.value = false;
    itemList[index].isWishList.value = true;
    ProductDetailDialog.showWishlistDialog(
        Get.context!, product?.name ?? '', productImage(index));
  }

  StockItem convertStockItem(StockItem? stockItem) {
    StockItem stockItems = StockItem();
    stockItems.itemId = stockItem?.itemId;
    stockItems.productId = stockItem?.productId;
    stockItems.stockId = stockItem?.stockId;
    stockItems.qty = stockItem?.qty;
    stockItems.isInStock = stockItem?.isInStock;
    stockItems.isQtyDecimal = stockItem?.isQtyDecimal;
    stockItems.showDefaultNotificationMessage =
        stockItem?.showDefaultNotificationMessage;
    stockItems.useConfigMinQty = stockItem?.useConfigMinQty;
    stockItems.minQty = stockItem?.minQty;
    stockItems.useConfigMinSaleQty = stockItem?.useConfigMinSaleQty;
    stockItems.minSaleQty = stockItem?.minSaleQty;
    stockItems.useConfigMaxSaleQty = stockItem?.useConfigMaxSaleQty;
    stockItems.maxSaleQty = stockItem?.maxSaleQty;
    stockItems.useConfigBackorders = stockItem?.useConfigBackorders;
    stockItems.backorders = stockItem?.backorders;
    stockItems.useConfigNotifyStockQty = stockItem?.useConfigNotifyStockQty;
    stockItems.notifyStockQty = stockItem?.notifyStockQty;
    stockItems.useConfigQtyIncrements = stockItem?.useConfigQtyIncrements;
    stockItems.qtyIncrements = stockItem?.qtyIncrements;
    stockItems.useConfigEnableQtyInc = stockItem?.useConfigEnableQtyInc;
    stockItems.enableQtyIncrements = stockItem?.enableQtyIncrements;
    stockItems.useConfigManageStock = stockItem?.useConfigManageStock;
    stockItems.manageStock = stockItem?.manageStock;
    stockItems.isDecimalDivided = stockItem?.isDecimalDivided;
    stockItems.stockStatusChangedAuto = stockItem?.stockStatusChangedAuto;
    return stockItems;
  }

  List<ConfigurableProductOption> getConfigurableProduct(
    List<ConfigurableProductOption>? configurableProductOptions,
  ) {
    List<ConfigurableProductOption> configurableProductList = [];
    for (ConfigurableProductOption element
        in configurableProductOptions ?? []) {
      ConfigurableProductOption configurableProductOption =
          ConfigurableProductOption();
      List<Values> valuesList = [];

      configurableProductOption.id = element.id;
      configurableProductOption.label = element.label;
      configurableProductOption.attributeId = element.attributeId;
      configurableProductOption.position = element.position;
      configurableProductOption.productId = element.productId;

      element.values?.forEach((valueData) {
        Values values = Values(
          valueIndex: valueData.valueIndex,
        );
        valuesList.add(
          values,
        );
      });

      configurableProductOption.values = valuesList;

      configurableProductList.add(configurableProductOption);
    }
    return configurableProductList;
  }
  RxBool isFilterLoading = false.obs;
  Future<void> getUpdatedFilteredProducts() async {
    for (var i = 0; i < (filterModelList?.length ?? 0); i++) {
      filterModelList![i].isSelected = false;
    }
    productIsEnded.value = false;
    currentPage.value = 0;
    productCount.value = 0;
    itemList.clear();

    isFilterLoading.value = true;
    isLoading.value = true;
    String url = "";
    selectedMap.forEach((key, value) {
      if (key == "cat") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredCatProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredCatProductListInConditionEndPoint;
        }
      } else if (key == "price") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredPriceProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace;
        }
      } else if (key == "size_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredSizeProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredSizeProductListInConditionEndPoint;
        }
      } else if (key == "color_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredColorProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredColorProductListInConditionEndPoint;
        }
      } else if (key == "brands") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredBrandProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredBrandProductListInConditionEndPoint;
        }
      }
    });
    url = url +
        AppConstants.filteredPriceProductListEndPointForPriceRangeFrom +
        currentRangeValues.start.toString() +
        AppConstants.filteredPriceFromProductListEndPoint +
        AppConstants.filteredPriceProductListEndPointForPriceRangeTo +
        currentRangeValues.end.toString() +
        AppConstants.filteredPriceToProductListEndPoint;

    debugPrint(url);

    try {
      ProductModel data = await productListAPIRepository
          .getFilteredProductListApiResponse(id.value + url);
      productModel?.value = data;
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);
      productLoading.value = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        productLoading.value = false;
      }
      isFilterLoading.value = false;
      isLoading.value = false;
      Get.back<dynamic>();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isFilterLoading.value = false;
      isLoading.value = false;
    }
  }

  String getPriceRangeWithCurrencyForFilter() {
    if (localStore.currentCurrency == 'EUR') {
      return '€${currentRangeValues.start.round().toString()} - €${currentRangeValues.end.round().toString()}';
    } else {
      return '${localStore.currentCurrency} ${currentRangeValues.start.round().toString()} - ${localStore.currentCurrency} ${currentRangeValues.end.round().toString()}';
    }
  }
  List<Category> searchFilter(String itemTitle, List<Category>? cat) {
    List<Category> results = [];
    if (itemTitle.isNotEmpty) {
      isSearch = true;
      update();

      results = cat!
          .where((element) =>
      (element.display
          ?.toLowerCase()
          .toString()
          .contains(itemTitle.toLowerCase())) ??
          false)
          .toList();
      cat = results;
      debugPrint(
        "Results: ${results.length.toString()} ${cat.length.toString()}",
      );
    } else {
      isSearch = false;
      update();
      for (int i = 0; i < (filterModelList?.length ?? 0); i++) {
        if (i == currentCategoryIndex.value) {
          filterModel?.value = filterModelList![i];
          cat = filterModel?.value.category!;
        }
      }
    }
    return results;
  }
}

class SortValue {
  final String? name;
  final String? value;

  SortValue(this.name, this.value);
}
