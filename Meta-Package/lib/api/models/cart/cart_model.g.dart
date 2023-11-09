// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isActive: json['is_active'] as bool?,
      isVirtual: json['is_virtual'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: json['items_count'] as int?,
      itemsQty: json['items_qty'] as int?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      billingAddress: json['billing_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      origOrderId: json['orig_order_id'] as int?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      customerIsGuest: json['customer_is_guest'] as bool?,
      customerNoteNotify: json['customer_note_notify'] as bool?,
      customerTaxClassId: json['customer_tax_class_id'] as int?,
      storeId: json['store_id'] as int?,
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributesCart.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_active': instance.isActive,
      'is_virtual': instance.isVirtual,
      'items': instance.items,
      'items_count': instance.itemsCount,
      'items_qty': instance.itemsQty,
      'customer': instance.customer,
      'billing_address': instance.billingAddress,
      'orig_order_id': instance.origOrderId,
      'currency': instance.currency,
      'customer_is_guest': instance.customerIsGuest,
      'customer_note_notify': instance.customerNoteNotify,
      'customer_tax_class_id': instance.customerTaxClassId,
      'store_id': instance.storeId,
      'extension_attributes': instance.extensionAttributes,
    };

ExtensionAttributesItemImage _$ExtensionAttributesItemImageFromJson(
        Map<String, dynamic> json) =>
    ExtensionAttributesItemImage(
      productImage: json['product_image'] as String?,
    );

Map<String, dynamic> _$ExtensionAttributesItemImageToJson(
        ExtensionAttributesItemImage instance) =>
    <String, dynamic>{
      'product_image': instance.productImage,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      itemId: json['item_id'] as int?,
      sku: json['sku'] as String?,
      qty: json['qty'] as int?,
      name: json['name'] as String?,
      price: json['price'],
      productType: json['product_type'] as String?,
      quoteId: json['quote_id'] as String?,
      imageUrl: json['image_url'] as String?,
      extensionAttributesImage: json['extension_attributes'] == null
          ? null
          : ExtensionAttributesItemImage.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'sku': instance.sku,
      'qty': instance.qty,
      'name': instance.name,
      'price': instance.price,
      'product_type': instance.productType,
      'quote_id': instance.quoteId,
      'image_url': instance.imageUrl,
      'extension_attributes': instance.extensionAttributesImage,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int?,
      groupId: json['group_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdIn: json['created_in'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      storeId: json['store_id'],
      websiteId: json['website_id'] as int?,
      addresses: json['addresses'] as List<dynamic>?,
      disableAutoGroupChange: json['disable_auto_group_change'] as int?,
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_in': instance.createdIn,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'store_id': instance.storeId,
      'website_id': instance.websiteId,
      'addresses': instance.addresses,
      'disable_auto_group_change': instance.disableAutoGroupChange,
      'extension_attributes': instance.extensionAttributes,
    };

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) =>
    ExtensionAttributes(
      isSubscribed: json['is_subscribed'] as bool?,
    );

Map<String, dynamic> _$ExtensionAttributesToJson(
        ExtensionAttributes instance) =>
    <String, dynamic>{
      'is_subscribed': instance.isSubscribed,
    };

BillingAddress _$BillingAddressFromJson(Map<String, dynamic> json) =>
    BillingAddress(
      id: json['id'] as int?,
      region: json['region'],
      regionId: json['region_id'],
      regionCode: json['region_code'],
      countryId: json['country_id'],
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'],
      postcode: json['postcode'] as String?,
      city: json['city'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      customerId: json['customer_id'] as int?,
      email: json['email'] as String?,
      sameAsBilling: json['same_as_billing'] as int?,
      saveInAddressBook: json['save_in_address_book'] as int?,
    );

Map<String, dynamic> _$BillingAddressToJson(BillingAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'region_id': instance.regionId,
      'region_code': instance.regionCode,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'customer_id': instance.customerId,
      'email': instance.email,
      'same_as_billing': instance.sameAsBilling,
      'save_in_address_book': instance.saveInAddressBook,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      globalCurrencyCode: json['global_currency_code'] as String?,
      baseCurrencyCode: json['base_currency_code'] as String?,
      storeCurrencyCode: json['store_currency_code'] as String?,
      quoteCurrencyCode: json['quote_currency_code'] as String?,
      storeToBaseRate: json['store_to_base_rate'] as int?,
      storeToQuoteRate: json['store_to_quote_rate'] as int?,
      baseToGlobalRate: json['base_to_global_rate'] as int?,
      baseToQuoteRate: (json['base_to_quote_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'global_currency_code': instance.globalCurrencyCode,
      'base_currency_code': instance.baseCurrencyCode,
      'store_currency_code': instance.storeCurrencyCode,
      'quote_currency_code': instance.quoteCurrencyCode,
      'store_to_base_rate': instance.storeToBaseRate,
      'store_to_quote_rate': instance.storeToQuoteRate,
      'base_to_global_rate': instance.baseToGlobalRate,
      'base_to_quote_rate': instance.baseToQuoteRate,
    };

ExtensionAttributesCart _$ExtensionAttributesCartFromJson(
        Map<String, dynamic> json) =>
    ExtensionAttributesCart(
      shippingAssignments: (json['shipping_assignments'] as List<dynamic>?)
          ?.map((e) => ShippingAssignments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExtensionAttributesCartToJson(
        ExtensionAttributesCart instance) =>
    <String, dynamic>{
      'shipping_assignments': instance.shippingAssignments,
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
      method: json['method'],
    );

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'address': instance.address,
      'method': instance.method,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as int?,
      region: json['region'],
      regionId: json['region_id'],
      regionCode: json['region_code'],
      countryId: json['country_id'],
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'],
      postcode: json['postcode'] as String?,
      city: json['city'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      customerId: json['customer_id'] as int?,
      email: json['email'] as String?,
      sameAsBilling: json['same_as_billing'] as int?,
      saveInAddressBook: json['save_in_address_book'] as int?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'region_id': instance.regionId,
      'region_code': instance.regionCode,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'customer_id': instance.customerId,
      'email': instance.email,
      'same_as_billing': instance.sameAsBilling,
      'save_in_address_book': instance.saveInAddressBook,
    };

ItemsCart _$ItemsCartFromJson(Map<String, dynamic> json) => ItemsCart(
      itemId: json['item_id'] as int?,
      sku: json['sku'] as String?,
      qty: json['qty'] as int?,
      name: json['name'] as String?,
      price: json['price'],
      productType: json['product_type'] as String?,
      quoteId: json['quote_id'] as String?,
    );

Map<String, dynamic> _$ItemsCartToJson(ItemsCart instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'sku': instance.sku,
      'qty': instance.qty,
      'name': instance.name,
      'price': instance.price,
      'product_type': instance.productType,
      'quote_id': instance.quoteId,
    };
