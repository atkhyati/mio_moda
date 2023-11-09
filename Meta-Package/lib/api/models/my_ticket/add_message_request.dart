import 'package:json_annotation/json_annotation.dart';

part 'add_message_request.g.dart';

@JsonSerializable()
class AddMessageRequest {
  AddMessageRequest(
      {this.website, this.ticketId, this.action, this.message, this.email});

  @JsonKey(name: 'website')
  dynamic website;
  @JsonKey(name: 'ticket_id')
  dynamic ticketId;
  @JsonKey(name: 'message')
  dynamic message;
  @JsonKey(name: 'action')
  dynamic action;
  @JsonKey(name: 'email')
  dynamic email;

  factory AddMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$AddMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddMessageRequestToJson(this);
}
