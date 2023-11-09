import 'package:json_annotation/json_annotation.dart';

part 'donation_modal.g.dart';

@JsonSerializable()
class DonationModal {
  DonationModal({
    this.success,
    this.items,
  });

  bool? success;
  List<DonationItems>? items;

  factory DonationModal.fromJson(Map<String, dynamic> json) =>
      _$DonationModalFromJson(json);

  Map<String, dynamic> toJson() => _$DonationModalToJson(this);
}

@JsonSerializable()
class DonationItems {
  DonationItems({
    this.donationId,
    this.imageURL,
  });

  @JsonKey(name: 'donationId')
  String? donationId;
  @JsonKey(name: 'imageURL')
  String? imageURL;

  factory DonationItems.fromJson(Map<String, dynamic> json) =>
      _$DonationItemsFromJson(json);

  Map<String, dynamic> toJson() => _$DonationItemsToJson(this);
}
