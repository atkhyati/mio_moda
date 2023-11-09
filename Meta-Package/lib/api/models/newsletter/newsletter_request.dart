// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'newsletter_request.g.dart';

@JsonSerializable()
class NewsletterRequestModel {
  NewsletterRequestModel({this.customer});

  Customer1? customer;

  factory NewsletterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NewsletterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsletterRequestModelToJson(this);
}

@JsonSerializable()
class Customer1 {
  Customer1(
      {this.id,
      this.email,
      this.firstname,
      this.lastname,
      this.store_id,
      this.website_id,
      // this.extensionAttributes,
      this.redExtensionAttributes});

  @JsonKey(name: 'id')
  dynamic id;
  @JsonKey(name: 'email')
  dynamic email;
  @JsonKey(name: 'firstname')
  dynamic firstname;
  @JsonKey(name: 'lastname')
  dynamic lastname;
  @JsonKey(name: 'store_id')
  dynamic store_id;
  @JsonKey(name: 'website_id')
  dynamic website_id;
  // @JsonKey(name: 'extension_attributes')
  // RequestExtAttribute? extensionAttributes;
  @JsonKey(name: 'extension_attributes')
  Map<String, dynamic>? redExtensionAttributes;

  factory Customer1.fromJson(Map<String, dynamic> json) =>
      _$Customer1FromJson(json);

  Map<String, dynamic> toJson() => _$Customer1ToJson(this);
}

@JsonSerializable()
class RequestExtAttribute {
  RequestExtAttribute({
    this.is_subscribed,
  });
  bool? is_subscribed;
  factory RequestExtAttribute.fromJson(Map<String, dynamic> json) =>
      _$RequestExtAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$RequestExtAttributeToJson(this);
}
