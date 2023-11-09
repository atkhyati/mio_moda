// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingInformationModel _$ShippingInformationModelFromJson(
        Map<String, dynamic> json) =>
    ShippingInformationModel(
      paymentMethods: (json['payment_methods'] as List<dynamic>?)
          ?.map((e) => PaymentMethods.fromJson(e as Map<String, dynamic>))
          .toList(),
      totals: json['totals'] == null
          ? null
          : Totals.fromJson(json['totals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingInformationModelToJson(
        ShippingInformationModel instance) =>
    <String, dynamic>{
      'payment_methods': instance.paymentMethods,
      'totals': instance.totals,
    };

PaymentMethods _$PaymentMethodsFromJson(Map<String, dynamic> json) =>
    PaymentMethods(
      code: json['code'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PaymentMethodsToJson(PaymentMethods instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
    };

Totals _$TotalsFromJson(Map<String, dynamic> json) => Totals(
      grandTotal: json['grand_total'],
      baseGrandTotal: json['base_grand_total'],
      subtotal: json['subtotal'],
      baseSubtotal: json['base_subtotal'],
      discountAmount: json['discount_amount'],
      baseDiscountAmount: json['base_discount_amount'],
      subtotalWithDiscount: json['subtotal_with_discount'],
      baseSubtotalWithDiscount: json['base_subtotal_with_discount'],
      shippingAmount: json['shipping_amount'],
      baseShippingAmount: json['base_shipping_amount'],
      shippingDiscountAmount: json['shipping_discount_amount'],
      baseShippingDiscountAmount: json['base_shipping_discount_amount'],
      taxAmount: json['tax_amount'],
      baseTaxAmount: json['base_tax_amount'],
      weeeTaxAppliedAmount: json['weee_tax_applied_amount'],
      shippingTaxAmount: json['shipping_tax_amount'],
      baseShippingTaxAmount: json['base_shipping_tax_amount'],
      subtotalInclTax: json['subtotal_incl_tax'],
      shippingInclTax: json['shipping_incl_tax'],
      baseShippingInclTax: json['base_shipping_incl_tax'],
      baseCurrencyCode: json['base_currency_code'] as String?,
      quoteCurrencyCode: json['quote_currency_code'] as String?,
      itemsQty: json['items_qty'],
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSegments: (json['total_segments'] as List<dynamic>?)
          ?.map((e) => TotalSegments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TotalsToJson(Totals instance) => <String, dynamic>{
      'grand_total': instance.grandTotal,
      'base_grand_total': instance.baseGrandTotal,
      'subtotal': instance.subtotal,
      'base_subtotal': instance.baseSubtotal,
      'discount_amount': instance.discountAmount,
      'base_discount_amount': instance.baseDiscountAmount,
      'subtotal_with_discount': instance.subtotalWithDiscount,
      'base_subtotal_with_discount': instance.baseSubtotalWithDiscount,
      'shipping_amount': instance.shippingAmount,
      'base_shipping_amount': instance.baseShippingAmount,
      'shipping_discount_amount': instance.shippingDiscountAmount,
      'base_shipping_discount_amount': instance.baseShippingDiscountAmount,
      'tax_amount': instance.taxAmount,
      'base_tax_amount': instance.baseTaxAmount,
      'weee_tax_applied_amount': instance.weeeTaxAppliedAmount,
      'shipping_tax_amount': instance.shippingTaxAmount,
      'base_shipping_tax_amount': instance.baseShippingTaxAmount,
      'subtotal_incl_tax': instance.subtotalInclTax,
      'shipping_incl_tax': instance.shippingInclTax,
      'base_shipping_incl_tax': instance.baseShippingInclTax,
      'base_currency_code': instance.baseCurrencyCode,
      'quote_currency_code': instance.quoteCurrencyCode,
      'items_qty': instance.itemsQty,
      'items': instance.items,
      'total_segments': instance.totalSegments,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      itemId: json['item_id'],
      price: json['price'],
      basePrice: json['base_price'],
      qty: json['qty'],
      rowTotal: json['row_total'],
      baseRowTotal: json['base_row_total'],
      rowTotalWithDiscount: json['row_total_with_discount'],
      taxAmount: json['tax_amount'],
      baseTaxAmount: json['base_tax_amount'],
      taxPercent: json['tax_percent'],
      discountAmount: json['discount_amount'],
      discountPercent: json['discount_percent'],
      baseDiscountAmount: json['base_discount_amount'],
      priceInclTax: json['price_incl_tax'],
      baseRowTotalInclTax: json['base_row_total_incl_tax'],
      basePriceInclTax: json['base_price_incl_tax'],
      rowTotalInclTax: json['row_total_incl_tax'],
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributesProductImage.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
      options: json['options'] as String?,
      weeeTaxAppliedAmount: json['weee_tax_applied_amount'],
      weeeTaxApplied: json['weee_tax_applied'],
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'price': instance.price,
      'base_price': instance.basePrice,
      'qty': instance.qty,
      'row_total': instance.rowTotal,
      'base_row_total': instance.baseRowTotal,
      'row_total_with_discount': instance.rowTotalWithDiscount,
      'tax_amount': instance.taxAmount,
      'base_tax_amount': instance.baseTaxAmount,
      'tax_percent': instance.taxPercent,
      'discount_amount': instance.discountAmount,
      'base_discount_amount': instance.baseDiscountAmount,
      'discount_percent': instance.discountPercent,
      'price_incl_tax': instance.priceInclTax,
      'base_price_incl_tax': instance.basePriceInclTax,
      'row_total_incl_tax': instance.rowTotalInclTax,
      'extension_attributes': instance.extensionAttributes,
      'base_row_total_incl_tax': instance.baseRowTotalInclTax,
      'options': instance.options,
      'weee_tax_applied_amount': instance.weeeTaxAppliedAmount,
      'weee_tax_applied': instance.weeeTaxApplied,
      'name': instance.name,
    };

ExtensionAttributesProductImage _$ExtensionAttributesProductImageFromJson(
        Map<String, dynamic> json) =>
    ExtensionAttributesProductImage(
      productImage: json['product_image'] as String?,
    );

Map<String, dynamic> _$ExtensionAttributesProductImageToJson(
        ExtensionAttributesProductImage instance) =>
    <String, dynamic>{
      'product_image': instance.productImage,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      label: json['label'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

TotalSegments _$TotalSegmentsFromJson(Map<String, dynamic> json) =>
    TotalSegments(
      code: json['code'] as String?,
      title: json['title'] as String?,
      area: json['area'] as String?,
      value: json['value'],
    );

Map<String, dynamic> _$TotalSegmentsToJson(TotalSegments instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'value': instance.value,
      'area': instance.area,
    };
