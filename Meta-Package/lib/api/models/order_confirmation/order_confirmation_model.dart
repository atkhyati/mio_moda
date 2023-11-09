import 'package:json_annotation/json_annotation.dart';

part 'order_confirmation_model.g.dart';

@JsonSerializable()
class OrderConfirmationModel {
  OrderConfirmationModel({
    this.baseCurrencyCode,
    this.baseDiscountAmount,
    this.baseGrandTotal,
    this.baseDiscountTaxCompensationAmount,
    this.baseShippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.baseSubtotal,
    this.baseSubtotalInclTax,
    this.baseTaxAmount,
    this.baseTotalDue,
    this.baseToGlobalRate,
    this.baseToOrderRate,
    this.billingAddressId,
    this.createdAt,
    this.customerDob,
    this.customerEmail,
    this.customerFirstname,
    this.customerGroupId,
    this.customerIsGuest,
    this.customerLastname,
    this.customerNoteNotify,
    this.discountAmount,
    this.emailSent,
    this.entityId,
    this.globalCurrencyCode,
    this.grandTotal,
    this.discountTaxCompensationAmount,
    this.incrementId,
    this.isVirtual,
    this.orderCurrencyCode,
    this.protectCode,
    this.quoteId,
    this.remoteIp,
    this.shippingAmount,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
    this.state,
    this.status,
    this.storeCurrencyCode,
    this.storeId,
    this.storeName,
    this.storeToBaseRate,
    this.storeToOrderRate,
    this.subtotal,
    this.subtotalInclTax,
    this.taxAmount,
    this.totalDue,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.updatedAt,
    this.weight,
    this.xForwardedFor,
    this.items,
    this.billingAddress,
    this.payment,
    this.statusHistories,
    this.extensionAttributes,
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
  dynamic billingAddressId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'customer_dob')
  String? customerDob;
  @JsonKey(name: 'customer_email')
  String? customerEmail;
  @JsonKey(name: 'customer_firstname')
  String? customerFirstname;
  @JsonKey(name: 'customer_group_id')
  dynamic customerGroupId;
  @JsonKey(name: 'customer_is_guest')
  dynamic customerIsGuest;
  @JsonKey(name: 'customer_lastname')
  String? customerLastname;
  @JsonKey(name: 'customer_note_notify')
  dynamic customerNoteNotify;
  @JsonKey(name: 'discount_amount')
  dynamic discountAmount;
  @JsonKey(name: 'email_sent')
  dynamic emailSent;
  @JsonKey(name: 'entity_id')
  dynamic entityId;
  @JsonKey(name: 'grand_total')
  dynamic grandTotal;
  @JsonKey(name: 'increment_id')
  String? incrementId;
  @JsonKey(name: 'is_virtual')
  dynamic isVirtual;
  @JsonKey(name: 'order_currency_code')
  String? orderCurrencyCode;
  @JsonKey(name: 'protect_code')
  String? protectCode;
  @JsonKey(name: 'shipping_amount')
  double? shippingAmount;
  String? state;
  String? status;
  @JsonKey(name: 'store_currency_code')
  String? storeCurrencyCode;
  @JsonKey(name: 'store_id')
  dynamic storeId;
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
  dynamic totalItemCount;
  @JsonKey(name: 'total_qty_ordered')
  dynamic totalQtyOrdered;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic weight;
  List<Items>? items;
  @JsonKey(name: 'billing_address')
  BillingAddress? billingAddress;
  Payment? payment;
  @JsonKey(name: 'status_histories')
  List<dynamic>? statusHistories;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttribute? extensionAttributes;
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
  dynamic quoteId;
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

  factory OrderConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$OrderConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderConfirmationModelToJson(this);
}

@JsonSerializable()
class Items {
  Items(
      {this.amountRefunded,
      this.baseAmountRefunded,
      this.baseDiscountAmount,
      this.baseDiscountInvoiced,
      this.baseDiscountTaxCompensationAmount,
      this.baseOriginalPrice,
      this.basePrice,
      this.basePriceInclTax,
      this.baseRowInvoiced,
      this.baseRowTotal,
      this.baseRowTotalInclTax,
      this.baseTaxAmount,
      this.baseTaxInvoiced,
      this.createdAt,
      this.discountAmount,
      this.discountInvoiced,
      this.discountPercent,
      this.freeShipping,
      this.discountTaxCompensationAmount,
      this.isQtyDecimal,
      this.isVirtual,
      this.itemId,
      this.name,
      this.noDiscount,
      this.orderId,
      this.originalPrice,
      this.parentItemId,
      this.price,
      this.priceInclTax,
      this.productId,
      this.productType,
      this.qtyCanceled,
      this.qtyInvoiced,
      this.qtyOrdered,
      this.qtyRefunded,
      this.qtyShipped,
      this.quoteItemId,
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
      this.productOption,
      this.extensionAttributess});

  @JsonKey(name: 'amount_refunded')
  double? amountRefunded;
  @JsonKey(name: 'base_amount_refunded')
  double? baseAmountRefunded;
  @JsonKey(name: 'base_cost')
  dynamic baseCost;
  @JsonKey(name: 'base_discount_amount')
  double? baseDiscountAmount;
  @JsonKey(name: 'base_discount_invoiced')
  dynamic baseDiscountInvoiced;
  @JsonKey(name: 'base_original_price')
  double? baseOriginalPrice;
  @JsonKey(name: 'base_price')
  double? basePrice;
  @JsonKey(name: 'base_price_incl_tax')
  double? basePriceInclTax;
  @JsonKey(name: 'base_row_invoiced')
  dynamic baseRowInvoiced;
  @JsonKey(name: 'base_row_total')
  double? baseRowTotal;
  @JsonKey(name: 'base_tax_amount')
  double? baseTaxAmount;
  @JsonKey(name: 'base_tax_invoiced')
  dynamic baseTaxInvoiced;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'discount_amount')
  double? discountAmount;
  @JsonKey(name: 'discount_invoiced')
  dynamic discountInvoiced;
  @JsonKey(name: 'discount_percent')
  dynamic discountPercent;
  @JsonKey(name: 'free_shipping')
  dynamic freeShipping;
  @JsonKey(name: 'is_virtual')
  dynamic isVirtual;
  @JsonKey(name: 'item_id')
  dynamic itemId;
  String? name;
  @JsonKey(name: 'no_discount')
  dynamic noDiscount;
  @JsonKey(name: 'order_id')
  dynamic orderId;
  @JsonKey(name: 'original_price')
  double? originalPrice;
  double? price;
  @JsonKey(name: 'price_incl_tax')
  double? priceInclTax;
  @JsonKey(name: 'product_id')
  dynamic productId;
  @JsonKey(name: 'product_type')
  String? productType;
  @JsonKey(name: 'qty_backordered')
  dynamic qtyBackordered;
  @JsonKey(name: 'qty_canceled')
  dynamic qtyCanceled;
  @JsonKey(name: 'qty_invoiced')
  dynamic qtyInvoiced;
  @JsonKey(name: 'qty_ordered')
  dynamic qtyOrdered;
  @JsonKey(name: 'qty_refunded')
  dynamic qtyRefunded;
  @JsonKey(name: 'qty_shipped')
  dynamic qtyShipped;
  @JsonKey(name: 'row_invoiced')
  dynamic rowInvoiced;
  @JsonKey(name: 'row_total')
  double? rowTotal;
  @JsonKey(name: 'row_total_incl_tax')
  double? rowTotalInclTax;
  @JsonKey(name: 'row_weight')
  dynamic rowWeight;
  String? sku;
  @JsonKey(name: 'store_id')
  dynamic storeId;
  @JsonKey(name: 'tax_amount')
  double? taxAmount;
  @JsonKey(name: 'tax_invoiced')
  dynamic taxInvoiced;
  @JsonKey(name: 'tax_percent')
  dynamic taxPercent;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic weight;
  @JsonKey(name: 'base_row_total_incl_tax')
  double? baseRowTotalInclTax;
  @JsonKey(name: 'base_discount_tax_compensation_amount')
  double? baseDiscountTaxCompensationAmount;
  @JsonKey(name: 'discount_tax_compensation_amount')
  double? discountTaxCompensationAmount;
  @JsonKey(name: 'is_qty_decimal')
  dynamic isQtyDecimal;
  @JsonKey(name: 'quote_item_id')
  dynamic quoteItemId;
  @JsonKey(name: 'product_option')
  ProductOption? productOption;
  @JsonKey(name: 'parent_item_id')
  int? parentItemId;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributess? extensionAttributess;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class ProductOption {
  ProductOption({
    this.extensionAttributes,
  });

  @JsonKey(name: 'extension_attributes')
  ExtensionAttributes? extensionAttributes;

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionToJson(this);
}

@JsonSerializable()
class ExtensionAttributess {
  ExtensionAttributess({
    this.productImage,
  });

  @JsonKey(name: 'product_image')
  final String? productImage;

  factory ExtensionAttributess.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributessFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributessToJson(this);
}

@JsonSerializable()
class ExtensionAttributes {
  ExtensionAttributes({
    this.configurableItemOptions,
  });

  @JsonKey(name: 'configurable_item_options')
  final List<ConfigurableItemOptions>? configurableItemOptions;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesToJson(this);
}

@JsonSerializable()
class ConfigurableItemOptions {
  ConfigurableItemOptions({
    this.optionId,
    this.optionValue,
  });

  @JsonKey(name: 'option_id')
  String? optionId;
  @JsonKey(name: 'option_value')
  int? optionValue;

  factory ConfigurableItemOptions.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableItemOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableItemOptionsToJson(this);
}

@JsonSerializable()
class BillingAddress {
  BillingAddress({
    this.region,
    this.regionCode,
    this.regionId,
    this.addressType,
    this.city,
    this.countryId,
    this.customerAddressId,
    this.email,
    this.entityId,
    this.firstname,
    this.lastname,
    this.parentId,
    this.postcode,
    this.street,
    this.telephone,
  });

  @JsonKey(name: 'address_type')
  String? addressType;
  String? city;
  @JsonKey(name: 'country_id')
  String? countryId;
  @JsonKey(name: 'customer_address_id')
  dynamic customerAddressId;
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

  factory BillingAddress.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$BillingAddressToJson(this);
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
  dynamic entityId;
  String? method;
  @JsonKey(name: 'parent_id')
  dynamic parentId;
  @JsonKey(name: 'amount_ordered')
  dynamic amountOrdered;
  @JsonKey(name: 'base_amount_ordered')
  dynamic baseAmountOrdered;
  @JsonKey(name: 'base_shipping_amount')
  dynamic baseShippingAmount;
  @JsonKey(name: 'shipping_amount')
  dynamic shippingAmount;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

@JsonSerializable()
class ExtensionAttribute {
  ExtensionAttribute({
    this.shippingAssignments,
    this.paymentAdditionalInfo,
    this.appliedTaxes,
    this.itemAppliedTaxes,
    this.estimatedShipping,
    this.credits,
  });

  @JsonKey(name: 'shipping_assignments')
  List<ShippingAssignments>? shippingAssignments;
  @JsonKey(name: 'payment_additional_info')
  List<PaymentAdditionalInfo>? paymentAdditionalInfo;
  @JsonKey(name: 'applied_taxes')
  List<dynamic>? appliedTaxes;
  @JsonKey(name: 'item_applied_taxes')
  List<dynamic>? itemAppliedTaxes;
  @JsonKey(name: 'estimated_shipping')
  String? estimatedShipping;
  Credits? credits;

  factory ExtensionAttribute.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributeToJson(this);
}

@JsonSerializable()
class ShippingAssignments {
  ShippingAssignments({
    this.shipping,
    this.items,
  });

  Shipping? shipping;
  final List<Items>? items;

  factory ShippingAssignments.fromJson(Map<String, dynamic> json) =>
      _$ShippingAssignmentsFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAssignmentsToJson(this);
}

@JsonSerializable()
class Shipping {
  Shipping({
    this.address,
    this.total,
  });

  Address? address;
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
  dynamic baseShippingAmount;
  @JsonKey(name: 'shipping_amount')
  dynamic shippingAmount;
  @JsonKey(name: 'base_shipping_discount_amount')
  dynamic baseShippingDiscountAmount;
  @JsonKey(name: 'base_shipping_discount_tax_compensation_amnt')
  int? baseShippingDiscountTaxCompensationAmnt;
  @JsonKey(name: 'base_shipping_incl_tax')
  int? baseShippingInclTax;
  @JsonKey(name: 'base_shipping_tax_amount')
  dynamic baseShippingTaxAmount;
  @JsonKey(name: 'shipping_discount_amount')
  dynamic shippingDiscountAmount;
  @JsonKey(name: 'shipping_discount_tax_compensation_amount')
  dynamic shippingDiscountTaxCompensationAmount;
  @JsonKey(name: 'shipping_incl_tax')
  dynamic shippingInclTax;
  @JsonKey(name: 'shipping_tax_amount')
  dynamic shippingTaxAmount;

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
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
class ItemsVal {
  ItemsVal(
      {this.amountRefunded,
      this.baseAmountRefunded,
      this.baseDiscountAmount,
      this.baseDiscountInvoiced,
      this.baseDiscountTaxCompensationAmount,
      this.baseOriginalPrice,
      this.basePrice,
      this.basePriceInclTax,
      this.baseRowInvoiced,
      this.baseRowTotal,
      this.baseRowTotalInclTax,
      this.baseTaxAmount,
      this.baseTaxInvoiced,
      this.createdAt,
      this.discountAmount,
      this.discountInvoiced,
      this.discountPercent,
      this.freeShipping,
      this.discountTaxCompensationAmount,
      this.isQtyDecimal,
      this.isVirtual,
      this.itemId,
      this.name,
      this.noDiscount,
      this.orderId,
      this.originalPrice,
      this.parentItemId,
      this.price,
      this.priceInclTax,
      this.productId,
      this.productType,
      this.qtyCanceled,
      this.qtyInvoiced,
      this.qtyOrdered,
      this.qtyRefunded,
      this.qtyShipped,
      this.quoteItemId,
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
      this.productOption,
      this.extensionAttributess});

  @JsonKey(name: 'amount_refunded')
  double? amountRefunded;
  @JsonKey(name: 'base_amount_refunded')
  double? baseAmountRefunded;
  @JsonKey(name: 'base_cost')
  dynamic baseCost;
  @JsonKey(name: 'base_discount_amount')
  double? baseDiscountAmount;
  @JsonKey(name: 'base_discount_invoiced')
  dynamic baseDiscountInvoiced;
  @JsonKey(name: 'base_original_price')
  double? baseOriginalPrice;
  @JsonKey(name: 'base_price')
  double? basePrice;
  @JsonKey(name: 'base_price_incl_tax')
  double? basePriceInclTax;
  @JsonKey(name: 'base_row_invoiced')
  dynamic baseRowInvoiced;
  @JsonKey(name: 'base_row_total')
  double? baseRowTotal;
  @JsonKey(name: 'base_tax_amount')
  double? baseTaxAmount;
  @JsonKey(name: 'base_tax_invoiced')
  dynamic baseTaxInvoiced;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'discount_amount')
  double? discountAmount;
  @JsonKey(name: 'discount_invoiced')
  dynamic discountInvoiced;
  @JsonKey(name: 'discount_percent')
  dynamic discountPercent;
  @JsonKey(name: 'free_shipping')
  dynamic freeShipping;
  @JsonKey(name: 'is_virtual')
  dynamic isVirtual;
  @JsonKey(name: 'item_id')
  dynamic itemId;
  String? name;
  @JsonKey(name: 'no_discount')
  dynamic noDiscount;
  @JsonKey(name: 'order_id')
  dynamic orderId;
  @JsonKey(name: 'original_price')
  double? originalPrice;
  double? price;
  @JsonKey(name: 'price_incl_tax')
  double? priceInclTax;
  @JsonKey(name: 'product_id')
  dynamic productId;
  @JsonKey(name: 'product_type')
  String? productType;
  @JsonKey(name: 'qty_backordered')
  dynamic qtyBackordered;
  @JsonKey(name: 'qty_canceled')
  dynamic qtyCanceled;
  @JsonKey(name: 'qty_invoiced')
  dynamic qtyInvoiced;
  @JsonKey(name: 'qty_ordered')
  dynamic qtyOrdered;
  @JsonKey(name: 'qty_refunded')
  dynamic qtyRefunded;
  @JsonKey(name: 'qty_shipped')
  dynamic qtyShipped;
  @JsonKey(name: 'row_invoiced')
  dynamic rowInvoiced;
  @JsonKey(name: 'row_total')
  double? rowTotal;
  @JsonKey(name: 'row_total_incl_tax')
  double? rowTotalInclTax;
  @JsonKey(name: 'row_weight')
  dynamic rowWeight;
  String? sku;
  @JsonKey(name: 'store_id')
  dynamic storeId;
  @JsonKey(name: 'tax_amount')
  double? taxAmount;
  @JsonKey(name: 'tax_invoiced')
  dynamic taxInvoiced;
  @JsonKey(name: 'tax_percent')
  dynamic taxPercent;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic weight;
  @JsonKey(name: 'base_row_total_incl_tax')
  double? baseRowTotalInclTax;
  @JsonKey(name: 'base_discount_tax_compensation_amount')
  double? baseDiscountTaxCompensationAmount;
  @JsonKey(name: 'discount_tax_compensation_amount')
  double? discountTaxCompensationAmount;
  @JsonKey(name: 'is_qty_decimal')
  dynamic isQtyDecimal;
  @JsonKey(name: 'quote_item_id')
  dynamic quoteItemId;
  @JsonKey(name: 'product_option')
  ProductOption? productOption;
  @JsonKey(name: 'parent_item_id')
  int? parentItemId;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributess? extensionAttributess;

  factory ItemsVal.fromJson(Map<String, dynamic> json) =>
      _$ItemsValFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsValToJson(this);
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
  dynamic attributeId;
  @JsonKey(name: 'order_id')
  dynamic orderId;
  dynamic credits;
  @JsonKey(name: 'credits_paid')
  dynamic creditsPaid;
  @JsonKey(name: 'credits_refunded')
  dynamic creditsRefunded;
  dynamic amount;
  @JsonKey(name: 'amount_paid')
  dynamic amountPaid;
  @JsonKey(name: 'amount_refunded')
  dynamic amountRefunded;
  @JsonKey(name: 'base_amount')
  dynamic baseAmount;
  @JsonKey(name: 'base_amount_paid')
  dynamic baseAmountPaid;
  @JsonKey(name: 'base_amount_refunded')
  dynamic baseAmountRefunded;

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}
