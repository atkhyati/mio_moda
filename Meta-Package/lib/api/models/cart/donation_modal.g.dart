// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationModal _$DonationModalFromJson(Map<String, dynamic> json) =>
    DonationModal(
      success: json['success'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => DonationItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DonationModalToJson(DonationModal instance) =>
    <String, dynamic>{
      'success': instance.success,
      'items': instance.items,
    };

DonationItems _$DonationItemsFromJson(Map<String, dynamic> json) =>
    DonationItems(
      donationId: json['donationId'] as String?,
      imageURL: json['imageURL'] as String?,
    );

Map<String, dynamic> _$DonationItemsToJson(DonationItems instance) =>
    <String, dynamic>{
      'donationId': instance.donationId,
      'imageURL': instance.imageURL,
    };
