import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  CartModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.isVirtual,
    this.items,
    this.itemsCount,
    this.itemsQty,
    this.customer,
    this.billingAddress,
    this.origOrderId,
    this.currency,
    this.customerIsGuest,
    this.customerNoteNotify,
    this.customerTaxClassId,
    this.storeId,
    this.extensionAttributes,
  });

  final int? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'is_virtual')
  final bool? isVirtual;
  final List<Items>? items;
  @JsonKey(name: 'items_count')
  final int? itemsCount;
  @JsonKey(name: 'items_qty')
  final int? itemsQty;
  final Customer? customer;
  @JsonKey(name: 'billing_address')
  final BillingAddress? billingAddress;
  @JsonKey(name: 'orig_order_id')
  final int? origOrderId;
  final Currency? currency;
  @JsonKey(name: 'customer_is_guest')
  final bool? customerIsGuest;
  @JsonKey(name: 'customer_note_notify')
  final bool? customerNoteNotify;
  @JsonKey(name: 'customer_tax_class_id')
  final int? customerTaxClassId;
  @JsonKey(name: 'store_id')
  final int? storeId;
  @JsonKey(name: 'extension_attributes')
  final ExtensionAttributesCart? extensionAttributes;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class ExtensionAttributesItemImage {
  ExtensionAttributesItemImage({
    this.productImage,
  });

  @JsonKey(name: 'product_image')
  final String? productImage;

  factory ExtensionAttributesItemImage.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesItemImageFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesItemImageToJson(this);
}

@JsonSerializable()
class Items {
  Items({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
    this.imageUrl,
    this.extensionAttributesImage,
  });

  @JsonKey(name: 'item_id')
  final int? itemId;
  final String? sku;
  final int? qty;
  final String? name;
  final dynamic price;
  @JsonKey(name: 'product_type')
  final String? productType;
  @JsonKey(name: 'quote_id')
  final String? quoteId;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'extension_attributes')
  final ExtensionAttributesItemImage? extensionAttributesImage;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Customer {
  Customer({
    this.id,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
  });

  final int? id;
  @JsonKey(name: 'group_id')
  final int? groupId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_in')
  final String? createdIn;
  final String? email;
  final String? firstname;
  final String? lastname;
  @JsonKey(name: 'store_id')
  final dynamic storeId;
  @JsonKey(name: 'website_id')
  final int? websiteId;
  final List<dynamic>? addresses;
  @JsonKey(name: 'disable_auto_group_change')
  final int? disableAutoGroupChange;
  @JsonKey(name: 'extension_attributes')
  final ExtensionAttributes? extensionAttributes;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class ExtensionAttributes {
  ExtensionAttributes({
    this.isSubscribed,
  });

  @JsonKey(name: 'is_subscribed')
  final bool? isSubscribed;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesToJson(this);
}

@JsonSerializable()
class BillingAddress {
  BillingAddress({
    this.id,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
    this.email,
    this.sameAsBilling,
    this.saveInAddressBook,
  });

  final int? id;
  final dynamic region;
  @JsonKey(name: 'region_id')
  final dynamic regionId;
  @JsonKey(name: 'region_code')
  final dynamic regionCode;
  @JsonKey(name: 'country_id')
  final dynamic countryId;
  final List<String>? street;
  final dynamic telephone;
  final String? postcode;
  final dynamic city;
  final dynamic firstname;
  final dynamic lastname;
  @JsonKey(name: 'customer_id')
  final int? customerId;
  final String? email;
  @JsonKey(name: 'same_as_billing')
  final int? sameAsBilling;
  @JsonKey(name: 'save_in_address_book')
  final int? saveInAddressBook;

  factory BillingAddress.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$BillingAddressToJson(this);
}

@JsonSerializable()
class Currency {
  Currency({
    this.globalCurrencyCode,
    this.baseCurrencyCode,
    this.storeCurrencyCode,
    this.quoteCurrencyCode,
    this.storeToBaseRate,
    this.storeToQuoteRate,
    this.baseToGlobalRate,
    this.baseToQuoteRate,
  });

  @JsonKey(name: 'global_currency_code')
  final String? globalCurrencyCode;
  @JsonKey(name: 'base_currency_code')
  final String? baseCurrencyCode;
  @JsonKey(name: 'store_currency_code')
  final String? storeCurrencyCode;
  @JsonKey(name: 'quote_currency_code')
  final String? quoteCurrencyCode;
  @JsonKey(name: 'store_to_base_rate')
  final int? storeToBaseRate;
  @JsonKey(name: 'store_to_quote_rate')
  final int? storeToQuoteRate;
  @JsonKey(name: 'base_to_global_rate')
  final int? baseToGlobalRate;
  @JsonKey(name: 'base_to_quote_rate')
  final double? baseToQuoteRate;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}

@JsonSerializable()
class ExtensionAttributesCart {
  ExtensionAttributesCart({
    this.shippingAssignments,
  });

  @JsonKey(name: 'shipping_assignments')
  final List<ShippingAssignments>? shippingAssignments;

  factory ExtensionAttributesCart.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesCartFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesCartToJson(this);
}

@JsonSerializable()
class ShippingAssignments {
  ShippingAssignments({
    this.shipping,
    this.items,
  });

  final Shipping? shipping;
  final List<Items>? items;

  factory ShippingAssignments.fromJson(Map<String, dynamic> json) =>
      _$ShippingAssignmentsFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAssignmentsToJson(this);
}

@JsonSerializable()
class Shipping {
  Shipping({
    this.address,
    this.method,
  });

  final Address? address;
  final dynamic method;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}

@JsonSerializable()
class Address {
  Address({
    this.id,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
    this.email,
    this.sameAsBilling,
    this.saveInAddressBook,
  });

  final int? id;
  final dynamic region;
  @JsonKey(name: 'region_id')
  final dynamic regionId;
  @JsonKey(name: 'region_code')
  final dynamic regionCode;
  @JsonKey(name: 'country_id')
  final dynamic countryId;
  final List<String>? street;
  final dynamic telephone;
  final String? postcode;
  final dynamic city;
  final dynamic firstname;
  final dynamic lastname;
  @JsonKey(name: 'customer_id')
  final int? customerId;
  final String? email;
  @JsonKey(name: 'same_as_billing')
  final int? sameAsBilling;
  @JsonKey(name: 'save_in_address_book')
  final int? saveInAddressBook;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class ItemsCart {
  ItemsCart({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
  });

  @JsonKey(name: 'item_id')
  final int? itemId;
  final String? sku;
  final int? qty;
  final String? name;
  final dynamic price;
  @JsonKey(name: 'product_type')
  final String? productType;
  @JsonKey(name: 'quote_id')
  final String? quoteId;

  factory ItemsCart.fromJson(Map<String, dynamic> json) =>
      _$ItemsCartFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsCartToJson(this);
}
