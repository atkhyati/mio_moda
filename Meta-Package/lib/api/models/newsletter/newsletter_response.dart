import 'package:json_annotation/json_annotation.dart';

part 'newsletter_response.g.dart';

@JsonSerializable()
class NewsletterResponse {
  NewsletterResponse({
   this.success,this.message
  });

  @JsonKey(name: 'success')
  dynamic success;
  @JsonKey(name: 'message')
  dynamic message;



  factory NewsletterResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsletterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsletterResponseToJson(this);
}