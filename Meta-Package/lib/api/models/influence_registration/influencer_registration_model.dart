import 'package:json_annotation/json_annotation.dart';

part 'influencer_registration_model.g.dart';

@JsonSerializable()
class InfluencerRegistrationMethodModel {
  InfluencerRegistrationMethodModel(
      {this.website,
      this.firstName,
      this.lastName,
      this.phone,
      this.emailaddress,
      this.facebook,
      this.facebookFollowers,
      this.instagram,
      this.instagramFollowers,
      this.twitter,
      this.twitterFollowers,
      this.youtube,
      this.youtubeFollowers,
      this.linkedin,
      this.linkedinFollowers,
      this.pinterest,
      this.pinterestFollowers,
      this.workedOn,
      this.websiteName,
      this.city,
      this.postcode,
      this.url,
      this.country,
      this.type,
      this.langCode});

  String? website;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? phone;
  String? emailaddress;
  String? facebook;
  @JsonKey(name: 'facebook_followers')
  String? facebookFollowers;
  String? instagram;
  @JsonKey(name: 'instagram_followers')
  String? instagramFollowers;
  String? twitter;
  @JsonKey(name: 'twitter_followers')
  String? twitterFollowers;
  String? youtube;
  @JsonKey(name: 'youtube_followers')
  String? youtubeFollowers;
  String? linkedin;
  @JsonKey(name: 'linkedin_followers')
  String? linkedinFollowers;
  String? pinterest;
  @JsonKey(name: 'pinterest_followers')
  String? pinterestFollowers;
  @JsonKey(name: 'worked_on')
  String? workedOn;
  @JsonKey(name: 'website_name')
  String? websiteName;
  String? url;
  String? city;
  String? postcode;
  String? country;
  String? type;
  @JsonKey(name: 'lang_code')
  String? langCode;

  factory InfluencerRegistrationMethodModel.fromJson(
          Map<String, dynamic> json) =>
      _$InfluencerRegistrationMethodModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InfluencerRegistrationMethodModelToJson(this);
}
