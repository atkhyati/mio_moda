// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderConfirmationModel _$OrderConfirmationModelFromJson(
        Map<String, dynamic> json) =>
    OrderConfirmationModel(
      baseCurrencyCode: json['base_currency_code'] as String?,
      baseDiscountAmount: json['base_discount_amount'],
      baseGrandTotal: json['base_grand_total'],
      baseDiscountTaxCompensationAmount:
          (json['base_discount_tax_compensation_amount'] as num?)?.toDouble(),
      baseShippingAmount: (json['base_shipping_amount'] as num?)?.toDouble(),
      baseShippingDiscountAmount:
          (json['base_shipping_discount_amount'] as num?)?.toDouble(),
      baseShippingDiscountTaxCompensationAmnt:
          (json['base_shipping_discount_tax_compensation_amnt'] as num?)
              ?.toDouble(),
      baseShippingInclTax: (json['base_shipping_incl_tax'] as num?)?.toDouble(),
      baseShippingTaxAmount:
          (json['base_shipping_tax_amount'] as num?)?.toDouble(),
      baseSubtotal: (json['base_subtotal'] as num?)?.toDouble(),
      baseSubtotalInclTax: (json['base_subtotal_incl_tax'] as num?)?.toDouble(),
      baseTaxAmount: (json['base_tax_amount'] as num?)?.toDouble(),
      baseTotalDue: json['base_total_due'],
      baseToGlobalRate: (json['base_to_global_rate'] as num?)?.toDouble(),
      baseToOrderRate: json['base_to_order_rate'],
      billingAddressId: json['billing_address_id'],
      createdAt: json['created_at'] as String?,
      customerDob: json['customer_dob'] as String?,
      customerEmail: json['customer_email'] as String?,
      customerFirstname: json['customer_firstname'] as String?,
      customerGroupId: json['customer_group_id'],
      customerIsGuest: json['customer_is_guest'],
      customerLastname: json['customer_lastname'] as String?,
      customerNoteNotify: json['customer_note_notify'],
      discountAmount: json['discount_amount'],
      emailSent: json['email_sent'],
      entityId: json['entity_id'],
      globalCurrencyCode: json['global_currency_code'] as String?,
      grandTotal: json['grand_total'],
      discountTaxCompensationAmount:
          (json['discount_tax_compensation_amount'] as num?)?.toDouble(),
      incrementId: json['increment_id'] as String?,
      isVirtual: json['is_virtual'],
      orderCurrencyCode: json['order_currency_code'] as String?,
      protectCode: json['protect_code'] as String?,
      quoteId: json['quote_id'],
      remoteIp: json['remote_ip'] as String?,
      shippingAmount: (json['shipping_amount'] as num?)?.toDouble(),
      shippingDiscountAmount:
          (json['shipping_discount_amount'] as num?)?.toDouble(),
      shippingDiscountTaxCompensationAmount:
          (json['shipping_discount_tax_compensation_amount'] as num?)
              ?.toDouble(),
      shippingInclTax: (json['shipping_incl_tax'] as num?)?.toDouble(),
      shippingTaxAmount: (json['shipping_tax_amount'] as num?)?.toDouble(),
      state: json['state'] as String?,
      status: json['status'] as String?,
      storeCurrencyCode: json['store_currency_code'] as String?,
      storeId: json['store_id'],
      storeName: json['store_name'] as String?,
      storeToBaseRate: (json['store_to_base_rate'] as num?)?.toDouble(),
      storeToOrderRate: (json['store_to_order_rate'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      subtotalInclTax: (json['subtotal_incl_tax'] as num?)?.toDouble(),
      taxAmount: (json['tax_amount'] as num?)?.toDouble(),
      totalDue: json['total_due'],
      totalItemCount: json['total_item_count'],
      totalQtyOrdered: json['total_qty_ordered'],
      updatedAt: json['updated_at'] as String?,
      weight: json['weight'],
      xForwardedFor: json['x_forwarded_for'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingAddress: json['billing_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      statusHistories: json['status_histories'] as List<dynamic>?,
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttribute.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderConfirmationModelToJson(
        OrderConfirmationModel instance) =>
    <String, dynamic>{
      'base_currency_code': instance.baseCurrencyCode,
      'base_discount_amount': instance.baseDiscountAmount,
      'base_grand_total': instance.baseGrandTotal,
      'base_shipping_amount': instance.baseShippingAmount,
      'base_subtotal': instance.baseSubtotal,
      'base_tax_amount': instance.baseTaxAmount,
      'base_total_due': instance.baseTotalDue,
      'billing_address_id': instance.billingAddressId,
      'created_at': instance.createdAt,
      'customer_dob': instance.customerDob,
      'customer_email': instance.customerEmail,
      'customer_firstname': instance.customerFirstname,
      'customer_group_id': instance.customerGroupId,
      'customer_is_guest': instance.customerIsGuest,
      'customer_lastname': instance.customerLastname,
      'customer_note_notify': instance.customerNoteNotify,
      'discount_amount': instance.discountAmount,
      'email_sent': instance.emailSent,
      'entity_id': instance.entityId,
      'grand_total': instance.grandTotal,
      'increment_id': instance.incrementId,
      'is_virtual': instance.isVirtual,
      'order_currency_code': instance.orderCurrencyCode,
      'protect_code': instance.protectCode,
      'shipping_amount': instance.shippingAmount,
      'state': instance.state,
      'status': instance.status,
      'store_currency_code': instance.storeCurrencyCode,
      'store_id': instance.storeId,
      'store_name': instance.storeName,
      'subtotal': instance.subtotal,
      'subtotal_incl_tax': instance.subtotalInclTax,
      'tax_amount': instance.taxAmount,
      'total_due': instance.totalDue,
      'total_item_count': instance.totalItemCount,
      'total_qty_ordered': instance.totalQtyOrdered,
      'updated_at': instance.updatedAt,
      'weight': instance.weight,
      'items': instance.items,
      'billing_address': instance.billingAddress,
      'payment': instance.payment,
      'status_histories': instance.statusHistories,
      'extension_attributes': instance.extensionAttributes,
      'base_discount_tax_compensation_amount':
          instance.baseDiscountTaxCompensationAmount,
      'base_shipping_discount_amount': instance.baseShippingDiscountAmount,
      'base_shipping_discount_tax_compensation_amnt':
          instance.baseShippingDiscountTaxCompensationAmnt,
      'base_shipping_incl_tax': instance.baseShippingInclTax,
      'base_shipping_tax_amount': instance.baseShippingTaxAmount,
      'base_subtotal_incl_tax': instance.baseSubtotalInclTax,
      'base_to_global_rate': instance.baseToGlobalRate,
      'base_to_order_rate': instance.baseToOrderRate,
      'global_currency_code': instance.globalCurrencyCode,
      'discount_tax_compensation_amount':
          instance.discountTaxCompensationAmount,
      'quote_id': instance.quoteId,
      'remote_ip': instance.remoteIp,
      'shipping_discount_amount': instance.shippingDiscountAmount,
      'shipping_discount_tax_compensation_amount':
          instance.shippingDiscountTaxCompensationAmount,
      'shipping_incl_tax': instance.shippingInclTax,
      'shipping_tax_amount': instance.shippingTaxAmount,
      'store_to_base_rate': instance.storeToBaseRate,
      'store_to_order_rate': instance.storeToOrderRate,
      'x_forwarded_for': instance.xForwardedFor,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      amountRefunded: (json['amount_refunded'] as num?)?.toDouble(),
      baseAmountRefunded: (json['base_amount_refunded'] as num?)?.toDouble(),
      baseDiscountAmount: (json['base_discount_amount'] as num?)?.toDouble(),
      baseDiscountInvoiced: json['base_discount_invoiced'],
      baseDiscountTaxCompensationAmount:
          (json['base_discount_tax_compensation_amount'] as num?)?.toDouble(),
      baseOriginalPrice: (json['base_original_price'] as num?)?.toDouble(),
      basePrice: (json['base_price'] as num?)?.toDouble(),
      basePriceInclTax: (json['base_price_incl_tax'] as num?)?.toDouble(),
      baseRowInvoiced: json['base_row_invoiced'],
      baseRowTotal: (json['base_row_total'] as num?)?.toDouble(),
      baseRowTotalInclTax:
          (json['base_row_total_incl_tax'] as num?)?.toDouble(),
      baseTaxAmount: (json['base_tax_amount'] as num?)?.toDouble(),
      baseTaxInvoiced: json['base_tax_invoiced'],
      createdAt: json['created_at'] as String?,
      discountAmount: (json['discount_amount'] as num?)?.toDouble(),
      discountInvoiced: json['discount_invoiced'],
      discountPercent: json['discount_percent'],
      freeShipping: json['free_shipping'],
      discountTaxCompensationAmount:
          (json['discount_tax_compensation_amount'] as num?)?.toDouble(),
      isQtyDecimal: json['is_qty_decimal'],
      isVirtual: json['is_virtual'],
      itemId: json['item_id'],
      name: json['name'] as String?,
      noDiscount: json['no_discount'],
      orderId: json['order_id'],
      originalPrice: (json['original_price'] as num?)?.toDouble(),
      parentItemId: json['parent_item_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      priceInclTax: (json['price_incl_tax'] as num?)?.toDouble(),
      productId: json['product_id'],
      productType: json['product_type'] as String?,
      qtyCanceled: json['qty_canceled'],
      qtyInvoiced: json['qty_invoiced'],
      qtyOrdered: json['qty_ordered'],
      qtyRefunded: json['qty_refunded'],
      qtyShipped: json['qty_shipped'],
      quoteItemId: json['quote_item_id'],
      rowInvoiced: json['row_invoiced'],
      rowTotal: (json['row_total'] as num?)?.toDouble(),
      rowTotalInclTax: (json['row_total_incl_tax'] as num?)?.toDouble(),
      rowWeight: json['row_weight'],
      sku: json['sku'] as String?,
      storeId: json['store_id'],
      taxAmount: (json['tax_amount'] as num?)?.toDouble(),
      taxInvoiced: json['tax_invoiced'],
      taxPercent: json['tax_percent'],
      updatedAt: json['updated_at'] as String?,
      productOption: json['product_option'] == null
          ? null
          : ProductOption.fromJson(
              json['product_option'] as Map<String, dynamic>),
      extensionAttributess: json['extension_attributes'] == null
          ? null
          : ExtensionAttributess.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    )
      ..baseCost = json['base_cost']
      ..qtyBackordered = json['qty_backordered']
      ..weight = json['weight'];

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'amount_refunded': instance.amountRefunded,
      'base_amount_refunded': instance.baseAmountRefunded,
      'base_cost': instance.baseCost,
      'base_discount_amount': instance.baseDiscountAmount,
      'base_discount_invoiced': instance.baseDiscountInvoiced,
      'base_original_price': instance.baseOriginalPrice,
      'base_price': instance.basePrice,
      'base_price_incl_tax': instance.basePriceInclTax,
      'base_row_invoiced': instance.baseRowInvoiced,
      'base_row_total': instance.baseRowTotal,
      'base_tax_amount': instance.baseTaxAmount,
      'base_tax_invoiced': instance.baseTaxInvoiced,
      'created_at': instance.createdAt,
      'discount_amount': instance.discountAmount,
      'discount_invoiced': instance.discountInvoiced,
      'discount_percent': instance.discountPercent,
      'free_shipping': instance.freeShipping,
      'is_virtual': instance.isVirtual,
      'item_id': instance.itemId,
      'name': instance.name,
      'no_discount': instance.noDiscount,
      'order_id': instance.orderId,
      'original_price': instance.originalPrice,
      'price': instance.price,
      'price_incl_tax': instance.priceInclTax,
      'product_id': instance.productId,
      'product_type': instance.productType,
      'qty_backordered': instance.qtyBackordered,
      'qty_canceled': instance.qtyCanceled,
      'qty_invoiced': instance.qtyInvoiced,
      'qty_ordered': instance.qtyOrdered,
      'qty_refunded': instance.qtyRefunded,
      'qty_shipped': instance.qtyShipped,
      'row_invoiced': instance.rowInvoiced,
      'row_total': instance.rowTotal,
      'row_total_incl_tax': instance.rowTotalInclTax,
      'row_weight': instance.rowWeight,
      'sku': instance.sku,
      'store_id': instance.storeId,
      'tax_amount': instance.taxAmount,
      'tax_invoiced': instance.taxInvoiced,
      'tax_percent': instance.taxPercent,
      'updated_at': instance.updatedAt,
      'weight': instance.weight,
      'base_row_total_incl_tax': instance.baseRowTotalInclTax,
      'base_discount_tax_compensation_amount':
          instance.baseDiscountTaxCompensationAmount,
      'discount_tax_compensation_amount':
          instance.discountTaxCompensationAmount,
      'is_qty_decimal': instance.isQtyDecimal,
      'quote_item_id': instance.quoteItemId,
      'product_option': instance.productOption,
      'parent_item_id': instance.parentItemId,
      'extension_attributes': instance.extensionAttributess,
    };

ProductOption _$ProductOptionFromJson(Map<String, dynamic> json) =>
    ProductOption(
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductOptionToJson(ProductOption instance) =>
    <String, dynamic>{
      'extension_attributes': instance.extensionAttributes,
    };

ExtensionAttributess _$ExtensionAttributessFromJson(
        Map<String, dynamic> json) =>
    ExtensionAttributess(
      productImage: json['product_image'] as String?,
    );

Map<String, dynamic> _$ExtensionAttributessToJson(
        ExtensionAttributess instance) =>
    <String, dynamic>{
      'product_image': instance.productImage,
    };

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) =>
    ExtensionAttributes(
      configurableItemOptions:
          (json['configurable_item_options'] as List<dynamic>?)
              ?.map((e) =>
                  ConfigurableItemOptions.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ExtensionAttributesToJson(
        ExtensionAttributes instance) =>
    <String, dynamic>{
      'configurable_item_options': instance.configurableItemOptions,
    };

ConfigurableItemOptions _$ConfigurableItemOptionsFromJson(
        Map<String, dynamic> json) =>
    ConfigurableItemOptions(
      optionId: json['option_id'] as String?,
      optionValue: json['option_value'] as int?,
    );

Map<String, dynamic> _$ConfigurableItemOptionsToJson(
        ConfigurableItemOptions instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'option_value': instance.optionValue,
    };

BillingAddress _$BillingAddressFromJson(Map<String, dynamic> json) =>
    BillingAddress(
      region: json['region'] as String?,
      regionCode: json['region_code'] as String?,
      regionId: json['region_id'] as int?,
      addressType: json['address_type'] as String?,
      city: json['city'] as String?,
      countryId: json['country_id'] as String?,
      customerAddressId: json['customer_address_id'],
      email: json['email'] as String?,
      entityId: json['entity_id'] as int?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      parentId: json['parent_id'] as int?,
      postcode: json['postcode'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'] as String?,
    );

Map<String, dynamic> _$BillingAddressToJson(BillingAddress instance) =>
    <String, dynamic>{
      'address_type': instance.addressType,
      'city': instance.city,
      'country_id': instance.countryId,
      'customer_address_id': instance.customerAddressId,
      'email': instance.email,
      'entity_id': instance.entityId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'parent_id': instance.parentId,
      'postcode': instance.postcode,
      'region': instance.region,
      'region_code': instance.regionCode,
      'region_id': instance.regionId,
      'street': instance.street,
      'telephone': instance.telephone,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      accountStatus: json['account_status'],
      additionalData: json['additional_data'] as String?,
      additionalInformation: (json['additional_information'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      ccLast4: json['cc_last4'],
      entityId: json['entity_id'],
      method: json['method'] as String?,
      parentId: json['parent_id'],
      amountOrdered: json['amount_ordered'],
      baseAmountOrdered: json['base_amount_ordered'],
      baseShippingAmount: json['base_shipping_amount'],
      shippingAmount: json['shipping_amount'],
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'account_status': instance.accountStatus,
      'additional_data': instance.additionalData,
      'additional_information': instance.additionalInformation,
      'cc_last4': instance.ccLast4,
      'entity_id': instance.entityId,
      'method': instance.method,
      'parent_id': instance.parentId,
      'amount_ordered': instance.amountOrdered,
      'base_amount_ordered': instance.baseAmountOrdered,
      'base_shipping_amount': instance.baseShippingAmount,
      'shipping_amount': instance.shippingAmount,
    };

ExtensionAttribute _$ExtensionAttributeFromJson(Map<String, dynamic> json) =>
    ExtensionAttribute(
      shippingAssignments: (json['shipping_assignments'] as List<dynamic>?)
          ?.map((e) => ShippingAssignments.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentAdditionalInfo: (json['payment_additional_info'] as List<dynamic>?)
          ?.map(
              (e) => PaymentAdditionalInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      appliedTaxes: json['applied_taxes'] as List<dynamic>?,
      itemAppliedTaxes: json['item_applied_taxes'] as List<dynamic>?,
      estimatedShipping: json['estimated_shipping'] as String?,
      credits: json['credits'] == null
          ? null
          : Credits.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtensionAttributeToJson(ExtensionAttribute instance) =>
    <String, dynamic>{
      'shipping_assignments': instance.shippingAssignments,
      'payment_additional_info': instance.paymentAdditionalInfo,
      'applied_taxes': instance.appliedTaxes,
      'item_applied_taxes': instance.itemAppliedTaxes,
      'estimated_shipping': instance.estimatedShipping,
      'credits': instance.credits,
    };

ShippingAssignments _$ShippingAssignmentsFromJson(Map<String, dynamic> json) =>
    ShippingAssignments(
      shipping: json['shipping'] == null
          ? null
          : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShippingAssignmentsToJson(
        ShippingAssignments instance) =>
    <String, dynamic>{
      'shipping': instance.shipping,
      'items': instance.items,
    };

Shipping _$ShippingFromJson(Map<String, dynamic> json) => Shipping(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      total: json['total'] == null
          ? null
          : Total.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'address': instance.address,
      'total': instance.total,
    };

Total _$TotalFromJson(Map<String, dynamic> json) => Total(
      baseShippingAmount: json['base_shipping_amount'],
      shippingAmount: json['shipping_amount'],
      baseShippingDiscountAmount: json['base_shipping_discount_amount'],
      baseShippingDiscountTaxCompensationAmnt:
          json['base_shipping_discount_tax_compensation_amnt'] as int?,
      baseShippingInclTax: json['base_shipping_incl_tax'] as int?,
      baseShippingTaxAmount: json['base_shipping_tax_amount'],
      shippingDiscountAmount: json['shipping_discount_amount'],
      shippingDiscountTaxCompensationAmount:
          json['shipping_discount_tax_compensation_amount'],
      shippingInclTax: json['shipping_incl_tax'],
      shippingTaxAmount: json['shipping_tax_amount'],
    );

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'base_shipping_amount': instance.baseShippingAmount,
      'shipping_amount': instance.shippingAmount,
      'base_shipping_discount_amount': instance.baseShippingDiscountAmount,
      'base_shipping_discount_tax_compensation_amnt':
          instance.baseShippingDiscountTaxCompensationAmnt,
      'base_shipping_incl_tax': instance.baseShippingInclTax,
      'base_shipping_tax_amount': instance.baseShippingTaxAmount,
      'shipping_discount_amount': instance.shippingDiscountAmount,
      'shipping_discount_tax_compensation_amount':
          instance.shippingDiscountTaxCompensationAmount,
      'shipping_incl_tax': instance.shippingInclTax,
      'shipping_tax_amount': instance.shippingTaxAmount,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressType: json['address_type'] as String?,
      city: json['city'] as String?,
      company: json['company'] as String?,
      countryId: json['country_id'] as String?,
      email: json['email'] as String?,
      entityId: json['entity_id'] as int?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      parentId: json['parent_id'] as int?,
      postcode: json['postcode'] as String?,
      region: json['region'] as String?,
      regionCode: json['region_code'] as String?,
      regionId: json['region_id'] as int?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_type': instance.addressType,
      'city': instance.city,
      'company': instance.company,
      'country_id': instance.countryId,
      'email': instance.email,
      'entity_id': instance.entityId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'parent_id': instance.parentId,
      'postcode': instance.postcode,
      'region': instance.region,
      'region_code': instance.regionCode,
      'region_id': instance.regionId,
      'street': instance.street,
      'telephone': instance.telephone,
    };

ItemsVal _$ItemsValFromJson(Map<String, dynamic> json) => ItemsVal(
      amountRefunded: (json['amount_refunded'] as num?)?.toDouble(),
      baseAmountRefunded: (json['base_amount_refunded'] as num?)?.toDouble(),
      baseDiscountAmount: (json['base_discount_amount'] as num?)?.toDouble(),
      baseDiscountInvoiced: json['base_discount_invoiced'],
      baseDiscountTaxCompensationAmount:
          (json['base_discount_tax_compensation_amount'] as num?)?.toDouble(),
      baseOriginalPrice: (json['base_original_price'] as num?)?.toDouble(),
      basePrice: (json['base_price'] as num?)?.toDouble(),
      basePriceInclTax: (json['base_price_incl_tax'] as num?)?.toDouble(),
      baseRowInvoiced: json['base_row_invoiced'],
      baseRowTotal: (json['base_row_total'] as num?)?.toDouble(),
      baseRowTotalInclTax:
          (json['base_row_total_incl_tax'] as num?)?.toDouble(),
      baseTaxAmount: (json['base_tax_amount'] as num?)?.toDouble(),
      baseTaxInvoiced: json['base_tax_invoiced'],
      createdAt: json['created_at'] as String?,
      discountAmount: (json['discount_amount'] as num?)?.toDouble(),
      discountInvoiced: json['discount_invoiced'],
      discountPercent: json['discount_percent'],
      freeShipping: json['free_shipping'],
      discountTaxCompensationAmount:
          (json['discount_tax_compensation_amount'] as num?)?.toDouble(),
      isQtyDecimal: json['is_qty_decimal'],
      isVirtual: json['is_virtual'],
      itemId: json['item_id'],
      name: json['name'] as String?,
      noDiscount: json['no_discount'],
      orderId: json['order_id'],
      originalPrice: (json['original_price'] as num?)?.toDouble(),
      parentItemId: json['parent_item_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      priceInclTax: (json['price_incl_tax'] as num?)?.toDouble(),
      productId: json['product_id'],
      productType: json['product_type'] as String?,
      qtyCanceled: json['qty_canceled'],
      qtyInvoiced: json['qty_invoiced'],
      qtyOrdered: json['qty_ordered'],
      qtyRefunded: json['qty_refunded'],
      qtyShipped: json['qty_shipped'],
      quoteItemId: json['quote_item_id'],
      rowInvoiced: json['row_invoiced'],
      rowTotal: (json['row_total'] as num?)?.toDouble(),
      rowTotalInclTax: (json['row_total_incl_tax'] as num?)?.toDouble(),
      rowWeight: json['row_weight'],
      sku: json['sku'] as String?,
      storeId: json['store_id'],
      taxAmount: (json['tax_amount'] as num?)?.toDouble(),
      taxInvoiced: json['tax_invoiced'],
      taxPercent: json['tax_percent'],
      updatedAt: json['updated_at'] as String?,
      productOption: json['product_option'] == null
          ? null
          : ProductOption.fromJson(
              json['product_option'] as Map<String, dynamic>),
      extensionAttributess: json['extension_attributes'] == null
          ? null
          : ExtensionAttributess.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    )
      ..baseCost = json['base_cost']
      ..qtyBackordered = json['qty_backordered']
      ..weight = json['weight'];

Map<String, dynamic> _$ItemsValToJson(ItemsVal instance) => <String, dynamic>{
      'amount_refunded': instance.amountRefunded,
      'base_amount_refunded': instance.baseAmountRefunded,
      'base_cost': instance.baseCost,
      'base_discount_amount': instance.baseDiscountAmount,
      'base_discount_invoiced': instance.baseDiscountInvoiced,
      'base_original_price': instance.baseOriginalPrice,
      'base_price': instance.basePrice,
      'base_price_incl_tax': instance.basePriceInclTax,
      'base_row_invoiced': instance.baseRowInvoiced,
      'base_row_total': instance.baseRowTotal,
      'base_tax_amount': instance.baseTaxAmount,
      'base_tax_invoiced': instance.baseTaxInvoiced,
      'created_at': instance.createdAt,
      'discount_amount': instance.discountAmount,
      'discount_invoiced': instance.discountInvoiced,
      'discount_percent': instance.discountPercent,
      'free_shipping': instance.freeShipping,
      'is_virtual': instance.isVirtual,
      'item_id': instance.itemId,
      'name': instance.name,
      'no_discount': instance.noDiscount,
      'order_id': instance.orderId,
      'original_price': instance.originalPrice,
      'price': instance.price,
      'price_incl_tax': instance.priceInclTax,
      'product_id': instance.productId,
      'product_type': instance.productType,
      'qty_backordered': instance.qtyBackordered,
      'qty_canceled': instance.qtyCanceled,
      'qty_invoiced': instance.qtyInvoiced,
      'qty_ordered': instance.qtyOrdered,
      'qty_refunded': instance.qtyRefunded,
      'qty_shipped': instance.qtyShipped,
      'row_invoiced': instance.rowInvoiced,
      'row_total': instance.rowTotal,
      'row_total_incl_tax': instance.rowTotalInclTax,
      'row_weight': instance.rowWeight,
      'sku': instance.sku,
      'store_id': instance.storeId,
      'tax_amount': instance.taxAmount,
      'tax_invoiced': instance.taxInvoiced,
      'tax_percent': instance.taxPercent,
      'updated_at': instance.updatedAt,
      'weight': instance.weight,
      'base_row_total_incl_tax': instance.baseRowTotalInclTax,
      'base_discount_tax_compensation_amount':
          instance.baseDiscountTaxCompensationAmount,
      'discount_tax_compensation_amount':
          instance.discountTaxCompensationAmount,
      'is_qty_decimal': instance.isQtyDecimal,
      'quote_item_id': instance.quoteItemId,
      'product_option': instance.productOption,
      'parent_item_id': instance.parentItemId,
      'extension_attributes': instance.extensionAttributess,
    };

PaymentAdditionalInfo _$PaymentAdditionalInfoFromJson(
        Map<String, dynamic> json) =>
    PaymentAdditionalInfo(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PaymentAdditionalInfoToJson(
        PaymentAdditionalInfo instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

Credits _$CreditsFromJson(Map<String, dynamic> json) => Credits(
      attributeId: json['attribute_id'],
      orderId: json['order_id'],
      credits: json['credits'],
      creditsPaid: json['credits_paid'],
      creditsRefunded: json['credits_refunded'],
      amount: json['amount'],
      amountPaid: json['amount_paid'],
      amountRefunded: json['amount_refunded'],
      baseAmount: json['base_amount'],
      baseAmountPaid: json['base_amount_paid'],
      baseAmountRefunded: json['base_amount_refunded'],
    );

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'attribute_id': instance.attributeId,
      'order_id': instance.orderId,
      'credits': instance.credits,
      'credits_paid': instance.creditsPaid,
      'credits_refunded': instance.creditsRefunded,
      'amount': instance.amount,
      'amount_paid': instance.amountPaid,
      'amount_refunded': instance.amountRefunded,
      'base_amount': instance.baseAmount,
      'base_amount_paid': instance.baseAmountPaid,
      'base_amount_refunded': instance.baseAmountRefunded,
    };
