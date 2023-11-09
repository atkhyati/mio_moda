import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_information_model.g.dart';

@JsonSerializable()
class ShippingInformationModel {
  ShippingInformationModel({
    this.paymentMethods,
    this.totals,
  });

  @JsonKey(name: 'payment_methods')
  List<PaymentMethods>? paymentMethods;
  Totals? totals;

  factory ShippingInformationModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInformationModelToJson(this);
}

@JsonSerializable()
class PaymentMethods {
  PaymentMethods({
    this.code,
    this.title,
  });

  String? code;
  String? title;

  factory PaymentMethods.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodsToJson(this);
}

@JsonSerializable()
class Totals {
  Totals(
      {this.grandTotal,
      this.baseGrandTotal,
      this.subtotal,
      this.baseSubtotal,
      this.discountAmount,
      this.baseDiscountAmount,
      this.subtotalWithDiscount,
      this.baseSubtotalWithDiscount,
      this.shippingAmount,
      this.baseShippingAmount,
      this.shippingDiscountAmount,
      this.baseShippingDiscountAmount,
      this.taxAmount,
      this.baseTaxAmount,
      this.weeeTaxAppliedAmount,
      this.shippingTaxAmount,
      this.baseShippingTaxAmount,
      this.subtotalInclTax,
      this.shippingInclTax,
      this.baseShippingInclTax,
      this.baseCurrencyCode,
      this.quoteCurrencyCode,
      this.itemsQty,
      this.items,
      this.totalSegments});

  @JsonKey(name: 'grand_total')
  dynamic grandTotal;
  @JsonKey(name: 'base_grand_total')
  dynamic baseGrandTotal;
  dynamic subtotal;
  @JsonKey(name: 'base_subtotal')
  dynamic baseSubtotal;
  @JsonKey(name: 'discount_amount')
  dynamic discountAmount;
  @JsonKey(name: 'base_discount_amount')
  dynamic baseDiscountAmount;
  @JsonKey(name: 'subtotal_with_discount')
  dynamic subtotalWithDiscount;
  @JsonKey(name: 'base_subtotal_with_discount')
  dynamic baseSubtotalWithDiscount;
  @JsonKey(name: 'shipping_amount')
  dynamic shippingAmount;
  @JsonKey(name: 'base_shipping_amount')
  dynamic baseShippingAmount;
  @JsonKey(name: 'shipping_discount_amount')
  dynamic shippingDiscountAmount;
  @JsonKey(name: 'base_shipping_discount_amount')
  dynamic baseShippingDiscountAmount;
  @JsonKey(name: 'tax_amount')
  dynamic taxAmount;
  @JsonKey(name: 'base_tax_amount')
  dynamic baseTaxAmount;
  @JsonKey(name: 'weee_tax_applied_amount')
  dynamic weeeTaxAppliedAmount = 0;
  @JsonKey(name: 'shipping_tax_amount')
  dynamic shippingTaxAmount;
  @JsonKey(name: 'base_shipping_tax_amount')
  dynamic baseShippingTaxAmount;
  @JsonKey(name: 'subtotal_incl_tax')
  dynamic subtotalInclTax;
  @JsonKey(name: 'shipping_incl_tax')
  dynamic shippingInclTax;
  @JsonKey(name: 'base_shipping_incl_tax')
  dynamic baseShippingInclTax;
  @JsonKey(name: 'base_currency_code')
  String? baseCurrencyCode;
  @JsonKey(name: 'quote_currency_code')
  String? quoteCurrencyCode;
  @JsonKey(name: 'items_qty')
  dynamic itemsQty;
  List<Items>? items;
  @JsonKey(name: 'total_segments')
  List<TotalSegments>? totalSegments;

  factory Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalsToJson(this);

  String? getSubTotal() {
    for (TotalSegments value in (totalSegments ?? [])) {
      if ((value.code ?? '') == 'subtotal') {
        return "${quoteCurrencyCode ?? ''} ${(value.value ?? '')}";
      }
    }
    return null;
  }

  String? getShipping() {
    for (TotalSegments value in (totalSegments ?? [])) {
      if ((value.code ?? '') == 'shipping') {
        return "${quoteCurrencyCode ?? ''} ${(value.value ?? '')}";
      }
    }
    return null;
  }

  String? getGiftWrap() {
    for (TotalSegments value in (totalSegments ?? [])) {
      if ((value.code ?? '') == 'amasty_checkout') {
        return "${quoteCurrencyCode ?? ''} ${(value.value ?? '')}";
      }
    }
    return null;
  }

  String? getTax() {
    for (TotalSegments value in (totalSegments ?? [])) {
      if ((value.code ?? '') == 'tax') {
        return "${quoteCurrencyCode ?? ''} ${(value.value ?? '')}";
      }
    }
    return null;
  }

  String? getGrandTotal() {
    for (TotalSegments value in (totalSegments ?? [])) {
      if ((value.code ?? '') == 'grand_total') {
        return "${quoteCurrencyCode ?? ''} ${(value.value ?? '')}";
      }
    }
    return null;
  }

  String? getDiscount() {
    for (TotalSegments value in (totalSegments ?? [])) {
      log('totalSegments is:-->>${(value.code ?? '').trim() == 'discount'} && ${(value.code ?? '').trim()}');
      if ((value.code ?? '').trim() == 'discount') {
        return "${quoteCurrencyCode ?? ''} ${(value.value ?? '')}";
      }
    }
    return null;
  }

  String? getDiscountName() {
    for (TotalSegments value in (totalSegments ?? [])) {
      if ((value.code ?? '') == 'discount') {
        return value.title ?? '';
      }
    }
    return null;
  }
}

@JsonSerializable()
class Items {
  Items({
    this.itemId,
    this.price,
    this.basePrice,
    this.qty,
    this.rowTotal,
    this.baseRowTotal,
    this.rowTotalWithDiscount,
    this.taxAmount,
    this.baseTaxAmount,
    this.taxPercent,
    this.discountAmount,
    this.discountPercent,
    this.baseDiscountAmount,
    this.priceInclTax,
    this.baseRowTotalInclTax,
    this.basePriceInclTax,
    this.rowTotalInclTax,
    this.extensionAttributes,
    this.options,
    this.weeeTaxAppliedAmount,
    this.weeeTaxApplied,
    this.name,
  });

  @JsonKey(name: 'item_id')
  dynamic itemId;
  dynamic price;
  @JsonKey(name: 'base_price')
  dynamic basePrice;
  dynamic qty;
  @JsonKey(name: 'row_total')
  dynamic rowTotal;
  @JsonKey(name: 'base_row_total')
  dynamic baseRowTotal;
  @JsonKey(name: 'row_total_with_discount')
  dynamic rowTotalWithDiscount;
  @JsonKey(name: 'tax_amount')
  dynamic taxAmount;
  @JsonKey(name: 'base_tax_amount')
  dynamic baseTaxAmount;
  @JsonKey(name: 'tax_percent')
  dynamic taxPercent;
  @JsonKey(name: 'discount_amount')
  dynamic discountAmount;
  @JsonKey(name: 'base_discount_amount')
  dynamic baseDiscountAmount;
  @JsonKey(name: 'discount_percent')
  dynamic discountPercent;
  @JsonKey(name: 'price_incl_tax')
  dynamic priceInclTax;
  @JsonKey(name: 'base_price_incl_tax')
  dynamic basePriceInclTax;
  @JsonKey(name: 'row_total_incl_tax')
  dynamic rowTotalInclTax;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributesProductImage? extensionAttributes;
  @JsonKey(name: 'base_row_total_incl_tax')
  dynamic baseRowTotalInclTax;
  String? options;
  @JsonKey(ignore: true)
  RxBool isOptionsOpen = false.obs;
  @JsonKey(name: 'weee_tax_applied_amount')
  dynamic weeeTaxAppliedAmount;
  @JsonKey(name: 'weee_tax_applied')
  dynamic weeeTaxApplied;
  String? name;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  String getOptionsLabel() {
    if (options != "[]") {
      List<dynamic> optionsMap = jsonDecode(options!) as List<dynamic>;
      List<Options> optionsList = (optionsMap)
          .map((itemWord) => Options.fromJson(itemWord as Map<String, dynamic>))
          .toList();
      return optionsList.first.label ?? '';
    }
    return "";
  }

  String getOptionsValue() {
    if (options != "[]") {
      List<dynamic> optionsMap = jsonDecode(options!) as List<dynamic>;
      List<Options> optionsList = (optionsMap)
          .map((itemWord) => Options.fromJson(itemWord as Map<String, dynamic>))
          .toList();
      return optionsList.first.value ?? '';
    }
    return "";
  }
}

@JsonSerializable()
class ExtensionAttributesProductImage {
  ExtensionAttributesProductImage({
    this.productImage,
  });

  @JsonKey(name: 'product_image')
  String? productImage;

  factory ExtensionAttributesProductImage.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesProductImageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ExtensionAttributesProductImageToJson(this);
}

@JsonSerializable()
class Options {
  Options({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

@JsonSerializable()
class TotalSegments {
  TotalSegments({
    this.code,
    this.title,
    this.area,
    this.value,
  });

  String? code;
  String? title;
  dynamic value;
  String? area;

  factory TotalSegments.fromJson(Map<String, dynamic> json) =>
      _$TotalSegmentsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalSegmentsToJson(this);
}
