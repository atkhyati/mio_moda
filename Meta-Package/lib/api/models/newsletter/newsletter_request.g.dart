// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsletter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsletterRequestModel _$NewsletterRequestModelFromJson(
        Map<String, dynamic> json) =>
    NewsletterRequestModel(
      customer: json['customer'] == null
          ? null
          : Customer1.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsletterRequestModelToJson(
        NewsletterRequestModel instance) =>
    <String, dynamic>{
      'customer': instance.customer,
    };

Customer1 _$Customer1FromJson(Map<String, dynamic> json) => Customer1(
      id: json['id'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      store_id: json['store_id'],
      website_id: json['website_id'],
      redExtensionAttributes:
          json['extension_attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$Customer1ToJson(Customer1 instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'store_id': instance.store_id,
      'website_id': instance.website_id,
      'extension_attributes': instance.redExtensionAttributes,
    };

RequestExtAttribute _$RequestExtAttributeFromJson(Map<String, dynamic> json) =>
    RequestExtAttribute(
      is_subscribed: json['is_subscribed'] as bool?,
    );

Map<String, dynamic> _$RequestExtAttributeToJson(
        RequestExtAttribute instance) =>
    <String, dynamic>{
      'is_subscribed': instance.is_subscribed,
    };
