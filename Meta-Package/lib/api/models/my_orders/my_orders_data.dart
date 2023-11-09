// To parse this JSON data, do
//
//     final myOrdersData = myOrdersDataFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';

part 'my_orders_data.g.dart';

@JsonSerializable()
class MyOrdersData {
  MyOrdersData({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  List<MyOrdersDataItem>? items;
  @JsonKey(name: 'search_criteria')
  SearchCriteria? searchCriteria;
  @JsonKey(name: 'total_count')
  int? totalCount;

  factory MyOrdersData.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrdersDataToJson(this);
}

@JsonSerializable()
class MyOrdersDataItem {
  MyOrdersDataItem({
    this.baseCurrencyCode,
    this.baseDiscountAmount,
    this.baseGrandTotal,
    this.baseShippingAmount,
    this.baseSubtotal,
    this.baseTaxAmount,
    this.baseTotalDue,
    this.billingAddressId,
    this.couponCode,
    this.createdAt,
    this.customerEmail,
    this.customerFirstname,
    this.customerGroupId,
    this.customerIsGuest,
    this.customerLastname,
    this.customerNoteNotify,
    this.discountAmount,
    this.discountDescription,
    this.emailSent,
    this.entityId,
    this.grandTotal,
    this.incrementId,
    this.isVirtual,
    this.orderCurrencyCode,
    this.protectCode,
    this.shippingAmount,
    this.shippingDescription,
    this.state,
    this.status,
    this.storeCurrencyCode,
    this.storeId,
    this.storeName,
    this.subtotal,
    this.subtotalInclTax,
    this.taxAmount,
    this.totalDue,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.updatedAt,
    this.weight,
    this.items,
    this.billingAddress,
    this.payment,
    this.statusHistories,
    this.extensionAttributes,
    this.baseDiscountTaxCompensationAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.baseSubtotalInclTax,
    this.baseToGlobalRate,
    this.baseToOrderRate,
    this.globalCurrencyCode,
    this.discountTaxCompensationAmount,
    this.quoteId,
    this.remoteIp,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
    this.storeToBaseRate,
    this.storeToOrderRate,
    this.xForwardedFor,
  });

  @JsonKey(name: 'base_currency_code')
  String? baseCurrencyCode;
  @JsonKey(name: 'base_discount_amount')
  dynamic baseDiscountAmount;
  @JsonKey(name: 'base_grand_total')
  dynamic baseGrandTotal;
  @JsonKey(name: 'base_shipping_amount')
  double? baseShippingAmount;
  @JsonKey(name: 'base_subtotal')
  double? baseSubtotal;
  @JsonKey(name: 'base_tax_amount')
  double? baseTaxAmount;
  @JsonKey(name: 'base_total_due')
  dynamic baseTotalDue;
  @JsonKey(name: 'billing_address_id')
  int? billingAddressId;
  @JsonKey(name: 'coupon_code')
  String? couponCode;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'customer_email')
  String? customerEmail;
  @JsonKey(name: 'customer_firstname')
  String? customerFirstname;
  @JsonKey(name: 'customer_group_id')
  int? customerGroupId;
  @JsonKey(name: 'customer_is_guest')
  int? customerIsGuest;
  @JsonKey(name: 'customer_lastname')
  String? customerLastname;
  @JsonKey(name: 'customer_note_notify')
  int? customerNoteNotify;
  @JsonKey(name: 'discount_amount')
  dynamic discountAmount;
  @JsonKey(name: 'discount_description')
  String? discountDescription;
  @JsonKey(name: 'email_sent')
  int? emailSent;
  @JsonKey(name: 'entity_id')
  int? entityId;
  @JsonKey(name: 'grand_total')
  dynamic grandTotal;
  @JsonKey(name: 'increment_id')
  String? incrementId;
  @JsonKey(name: 'is_virtual')
  int? isVirtual;
  @JsonKey(name: 'order_currency_code')
  String? orderCurrencyCode;
  @JsonKey(name: 'protect_code')
  String? protectCode;
  @JsonKey(name: 'shipping_amount')
  double? shippingAmount;
  @JsonKey(name: 'shipping_description')
  String? shippingDescription;
  String? state;
  String? status;
  @JsonKey(name: 'store_currency_code')
  String? storeCurrencyCode;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'store_name')
  String? storeName;
  double? subtotal;
  @JsonKey(name: 'subtotal_incl_tax')
  double? subtotalInclTax;
  @JsonKey(name: 'tax_amount')
  double? taxAmount;
  @JsonKey(name: 'total_due')
  dynamic totalDue;
  @JsonKey(name: 'total_item_count')
  int? totalItemCount;
  @JsonKey(name: 'total_qty_ordered')
  int? totalQtyOrdered;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  int? weight;
  List<ParentItemElement>? items;
  @JsonKey(name: 'billing_address')
  Address? billingAddress;
  Payment? payment;
  @JsonKey(name: 'status_histories')
  List<dynamic>? statusHistories;
  @JsonKey(name: 'extension_attributes')
  ItemExtensionAttributes? extensionAttributes;
  @JsonKey(name: 'base_discount_tax_compensation_amount')
  double? baseDiscountTaxCompensationAmount;
  @JsonKey(name: 'base_shipping_discount_amount')
  double? baseShippingDiscountAmount;
  @JsonKey(name: 'base_shipping_discount_tax_compensation_amnt')
  double? baseShippingDiscountTaxCompensationAmnt;
  @JsonKey(name: 'base_shipping_incl_tax')
  double? baseShippingInclTax;
  @JsonKey(name: 'base_shipping_tax_amount')
  double? baseShippingTaxAmount;
  @JsonKey(name: 'base_subtotal_incl_tax')
  double? baseSubtotalInclTax;
  @JsonKey(name: 'base_to_global_rate')
  double? baseToGlobalRate;
  @JsonKey(name: 'base_to_order_rate')
  dynamic baseToOrderRate;
  @JsonKey(name: 'global_currency_code')
  String? globalCurrencyCode;
  @JsonKey(name: 'discount_tax_compensation_amount')
  double? discountTaxCompensationAmount;
  @JsonKey(name: 'quote_id')
  int? quoteId;
  @JsonKey(name: 'remote_ip')
  String? remoteIp;
  @JsonKey(name: 'shipping_discount_amount')
  double? shippingDiscountAmount;
  @JsonKey(name: 'shipping_discount_tax_compensation_amount')
  double? shippingDiscountTaxCompensationAmount;
  @JsonKey(name: 'shipping_incl_tax')
  double? shippingInclTax;
  @JsonKey(name: 'shipping_tax_amount')
  double? shippingTaxAmount;
  @JsonKey(name: 'store_to_base_rate')
  double? storeToBaseRate;
  @JsonKey(name: 'store_to_order_rate')
  double? storeToOrderRate;
  @JsonKey(name: 'x_forwarded_for')
  String? xForwardedFor;

  factory MyOrdersDataItem.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrdersDataItemToJson(this);
}

@JsonSerializable()
class Address {
  Address({
    this.addressType,
    this.city,
    this.company,
    this.countryId,
    this.email,
    this.entityId,
    this.firstname,
    this.lastname,
    this.parentId,
    this.postcode,
    this.region,
    this.regionCode,
    this.regionId,
    this.street,
    this.telephone,
  });

  @JsonKey(name: 'address_type')
  String? addressType;
  String? city;
  String? company;
  @JsonKey(name: 'country_id')
  String? countryId;
  String? email;
  @JsonKey(name: 'entity_id')
  int? entityId;
  String? firstname;
  String? lastname;
  @JsonKey(name: 'parent_id')
  int? parentId;
  String? postcode;
  String? region;
  @JsonKey(name: 'region_code')
  String? regionCode;
  @JsonKey(name: 'region_id')
  int? regionId;
  List<String>? street;
  String? telephone;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class ExtensionAttributess {
  ExtensionAttributess({
    this.productImage,
    this.isReturnable,
    this.isCancellable,
  });

  @JsonKey(name: 'product_image')
  String? productImage;
  @JsonKey(name: 'is_returnable')
  String? isReturnable;
  @JsonKey(name: 'is_cancellable')
  String? isCancellable;

  factory ExtensionAttributess.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributessFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributessToJson(this);
}

@JsonSerializable()
class ItemExtensionAttributes {
  ItemExtensionAttributes({
    this.shippingAssignments,
    this.paymentAdditionalInfo,
    this.appliedTaxes,
    this.itemAppliedTaxes,
    this.paymentMethod,
    this.estimatedShipping,
    this.credits,
    this.isCancellable,
    this.isReturnable,
  });

  @JsonKey(name: 'shipping_assignments')
  List<ShippingAssignment>? shippingAssignments;
  @JsonKey(name: 'payment_additional_info')
  List<PaymentAdditionalInfo>? paymentAdditionalInfo;
  @JsonKey(name: 'applied_taxes')
  List<dynamic>? appliedTaxes;
  @JsonKey(name: 'item_applied_taxes')
  List<dynamic>? itemAppliedTaxes;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  @JsonKey(name: 'estimated_shipping')
  String? estimatedShipping;
  @JsonKey(name: 'is_returnable')
  String? isReturnable;
  @JsonKey(name: 'is_cancellable')
  String? isCancellable;
  Credits? credits;

  factory ItemExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ItemExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemExtensionAttributesToJson(this);
}

@JsonSerializable()
class Credits {
  Credits({
    this.attributeId,
    this.orderId,
    this.credits,
    this.creditsPaid,
    this.creditsRefunded,
    this.amount,
    this.amountPaid,
    this.amountRefunded,
    this.baseAmount,
    this.baseAmountPaid,
    this.baseAmountRefunded,
  });

  @JsonKey(name: 'attribute_id')
  int? attributeId;
  @JsonKey(name: 'order_id')
  int? orderId;
  int? credits;
  @JsonKey(name: 'credits_paid')
  int? creditsPaid;
  @JsonKey(name: 'credits_refunded')
  int? creditsRefunded;
  double? amount;
  @JsonKey(name: 'amount_paid')
  double? amountPaid;
  @JsonKey(name: 'amount_refunded')
  double? amountRefunded;
  @JsonKey(name: 'base_amount')
  double? baseAmount;
  @JsonKey(name: 'base_amount_paid')
  double? baseAmountPaid;
  @JsonKey(name: 'base_amount_refunded')
  double? baseAmountRefunded;

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}

@JsonSerializable()
class PaymentAdditionalInfo {
  PaymentAdditionalInfo({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory PaymentAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentAdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAdditionalInfoToJson(this);
}

@JsonSerializable()
class ShippingAssignment {
  ShippingAssignment({
    this.shipping,
    this.items,
  });

  Shipping? shipping;
  List<ParentItemElement>? items;

  factory ShippingAssignment.fromJson(Map<String, dynamic> json) =>
      _$ShippingAssignmentFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAssignmentToJson(this);
}

@JsonSerializable()
class ParentItemElement {
  ParentItemElement({
    this.amountRefunded,
    this.baseAmountRefunded,
    this.baseCost,
    this.baseDiscountAmount,
    this.baseDiscountInvoiced,
    this.baseOriginalPrice,
    this.basePrice,
    this.basePriceInclTax,
    this.baseRowInvoiced,
    this.baseRowTotal,
    this.baseTaxAmount,
    this.baseTaxInvoiced,
    this.createdAt,
    this.discountAmount,
    this.discountInvoiced,
    this.discountPercent,
    this.freeShipping,
    this.isVirtual,
    this.itemId,
    this.name,
    this.noDiscount,
    this.orderId,
    this.originalPrice,
    this.price,
    this.priceInclTax,
    this.productId,
    this.productType,
    this.qtyBackordered,
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyOrdered,
    this.qtyRefunded,
    this.qtyShipped,
    this.rowInvoiced,
    this.rowTotal,
    this.rowTotalInclTax,
    this.rowWeight,
    this.sku,
    this.storeId,
    this.taxAmount,
    this.taxInvoiced,
    this.taxPercent,
    this.updatedAt,
    this.weight,
    this.baseRowTotalInclTax,
    this.baseDiscountTaxCompensationAmount,
    this.discountTaxCompensationAmount,
    this.isQtyDecimal,
    this.quoteItemId,
    this.productOption,
    this.parentItemId,
    this.parentItem,
    this.extensionAttributess,
  });

  @JsonKey(name: 'amount_refunded')
  double? amountRefunded;
  @JsonKey(name: 'base_amount_refunded')
  double? baseAmountRefunded;
  @JsonKey(name: 'base_cost')
  int? baseCost;
  @JsonKey(name: 'base_discount_amount')
  double? baseDiscountAmount;
  @JsonKey(name: 'base_discount_invoiced')
  int? baseDiscountInvoiced;
  @JsonKey(name: 'base_original_price')
  double? baseOriginalPrice;
  @JsonKey(name: 'base_price')
  double? basePrice;
  @JsonKey(name: 'base_price_incl_tax')
  double? basePriceInclTax;
  @JsonKey(name: 'base_row_invoiced')
  int? baseRowInvoiced;
  @JsonKey(name: 'base_row_total')
  double? baseRowTotal;
  @JsonKey(name: 'base_tax_amount')
  double? baseTaxAmount;
  @JsonKey(name: 'base_tax_invoiced')
  int? baseTaxInvoiced;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'discount_amount')
  double? discountAmount;
  @JsonKey(name: 'discount_invoiced')
  int? discountInvoiced;
  @JsonKey(name: 'discount_percent')
  int? discountPercent;
  @JsonKey(name: 'free_shipping')
  int? freeShipping;
  @JsonKey(name: 'is_virtual')
  int? isVirtual;
  @JsonKey(name: 'item_id')
  int? itemId;
  String? name;
  @JsonKey(name: 'no_discount')
  int? noDiscount;
  @JsonKey(name: 'order_id')
  int? orderId;
  @JsonKey(name: 'original_price')
  double? originalPrice;
  double? price;
  @JsonKey(name: 'price_incl_tax')
  double? priceInclTax;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'product_type')
  String? productType;
  @JsonKey(name: 'qty_backordered')
  int? qtyBackordered;
  @JsonKey(name: 'qty_canceled')
  int? qtyCanceled;
  @JsonKey(name: 'qty_invoiced')
  int? qtyInvoiced;
  @JsonKey(name: 'qty_ordered')
  int? qtyOrdered;
  @JsonKey(name: 'qty_refunded')
  int? qtyRefunded;
  @JsonKey(name: 'qty_shipped')
  int? qtyShipped;
  @JsonKey(name: 'row_invoiced')
  int? rowInvoiced;
  @JsonKey(name: 'row_total')
  double? rowTotal;
  @JsonKey(name: 'row_total_incl_tax')
  double? rowTotalInclTax;
  @JsonKey(name: 'row_weight')
  int? rowWeight;
  String? sku;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'tax_amount')
  double? taxAmount;
  @JsonKey(name: 'tax_invoiced')
  int? taxInvoiced;
  @JsonKey(name: 'tax_percent')
  int? taxPercent;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  int? weight;
  @JsonKey(name: 'base_row_total_incl_tax')
  double? baseRowTotalInclTax;
  @JsonKey(name: 'base_discount_tax_compensation_amount')
  double? baseDiscountTaxCompensationAmount;
  @JsonKey(name: 'discount_tax_compensation_amount')
  double? discountTaxCompensationAmount;
  @JsonKey(name: 'is_qty_decimal')
  int? isQtyDecimal;
  @JsonKey(name: 'quote_item_id')
  int? quoteItemId;
  @JsonKey(name: 'product_option')
  ProductOption? productOption;
  @JsonKey(name: 'parent_item_id')
  int? parentItemId;
  @JsonKey(name: 'parent_item')
  ParentItemElement? parentItem;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributess? extensionAttributess;

  factory ParentItemElement.fromJson(Map<String, dynamic> json) =>
      _$ParentItemElementFromJson(json);

  Map<String, dynamic> toJson() => _$ParentItemElementToJson(this);
}

@JsonSerializable()
class ProductOption {
  ProductOption({
    this.extensionAttributes,
  });

  @JsonKey(name: 'extension_attributes')
  ProductOptionExtensionAttributes? extensionAttributes;

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionToJson(this);
}

@JsonSerializable()
class ProductOptionExtensionAttributes {
  ProductOptionExtensionAttributes({
    this.configurableItemOptions,
  });

  @JsonKey(name: 'configurable_item_options')
  List<ConfigurableItemOption>? configurableItemOptions;

  factory ProductOptionExtensionAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ProductOptionExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductOptionExtensionAttributesToJson(this);
}

@JsonSerializable()
class ConfigurableItemOption {
  ConfigurableItemOption({
    this.optionId,
    this.optionValue,
  });

  @JsonKey(name: 'option_id')
  String? optionId;
  @JsonKey(name: 'option_value')
  int? optionValue;

  factory ConfigurableItemOption.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableItemOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableItemOptionToJson(this);
}

@JsonSerializable()
class Shipping {
  Shipping({
    this.address,
    this.method,
    this.total,
  });

  Address? address;
  String? method;
  Total? total;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}

@JsonSerializable()
class Total {
  Total({
    this.baseShippingAmount,
    this.shippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
  });

  @JsonKey(name: 'base_shipping_amount')
  double? baseShippingAmount;
  @JsonKey(name: 'shipping_amount')
  double? shippingAmount;
  @JsonKey(name: 'base_shipping_discount_amount')
  double? baseShippingDiscountAmount;
  @JsonKey(name: 'base_shipping_discount_tax_compensation_amnt')
  int? baseShippingDiscountTaxCompensationAmnt;
  @JsonKey(name: 'base_shipping_incl_tax')
  int? baseShippingInclTax;
  @JsonKey(name: 'base_shipping_tax_amount')
  double? baseShippingTaxAmount;
  @JsonKey(name: 'shipping_discount_amount')
  double? shippingDiscountAmount;
  @JsonKey(name: 'shipping_discount_tax_compensation_amount')
  double? shippingDiscountTaxCompensationAmount;
  @JsonKey(name: 'shipping_incl_tax')
  double? shippingInclTax;
  @JsonKey(name: 'shipping_tax_amount')
  double? shippingTaxAmount;

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
}

@JsonSerializable()
class Payment {
  Payment({
    this.accountStatus,
    this.additionalData,
    this.additionalInformation,
    this.ccLast4,
    this.entityId,
    this.method,
    this.parentId,
    this.amountOrdered,
    this.baseAmountOrdered,
    this.baseShippingAmount,
    this.shippingAmount,
  });

  @JsonKey(name: 'account_status')
  dynamic accountStatus;
  @JsonKey(name: 'additional_data')
  String? additionalData;
  @JsonKey(name: 'additional_information')
  List<String?>? additionalInformation;
  @JsonKey(name: 'cc_last4')
  dynamic ccLast4;
  @JsonKey(name: 'entity_id')
  int? entityId;
  String? method;
  @JsonKey(name: 'parent_id')
  int? parentId;
  @JsonKey(name: 'amount_ordered')
  double? amountOrdered;
  @JsonKey(name: 'base_amount_ordered')
  double? baseAmountOrdered;
  @JsonKey(name: 'base_shipping_amount')
  double? baseShippingAmount;
  @JsonKey(name: 'shipping_amount')
  double? shippingAmount;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

@JsonSerializable()
class SearchCriteria {
  SearchCriteria({
    this.filterGroups,
  });

  @JsonKey(name: 'filter_groups')
  List<FilterGroup>? filterGroups;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$SearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCriteriaToJson(this);
}

@JsonSerializable()
class FilterGroup {
  FilterGroup({
    this.filters,
  });

  List<Filter>? filters;

  factory FilterGroup.fromJson(Map<String, dynamic> json) =>
      _$FilterGroupFromJson(json);

  Map<String, dynamic> toJson() => _$FilterGroupToJson(this);
}

@JsonSerializable()
class Filter {
  Filter({
    this.field,
    this.value,
    this.conditionType,
  });

  String? field;
  String? value;
  @JsonKey(name: 'condition_type')
  String? conditionType;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}
