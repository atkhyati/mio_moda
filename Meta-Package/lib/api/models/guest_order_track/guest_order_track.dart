import 'package:json_annotation/json_annotation.dart';

part 'guest_order_track.g.dart';

@JsonSerializable()
class GuestOrderRequest {
  GuestOrderRequest(
      {this.orderId, this.billingLastName, this.type, this.email});

  @JsonKey(name: 'order_id')
  String? orderId;
  @JsonKey(name: 'billing_last_name')
  String? billingLastName;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'email')
  String? email;

  factory GuestOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestOrderRequestToJson(this);
}

@JsonSerializable()
class GuestOrderForm {
  GuestOrderForm(this.guestOrderForm);

  Map<String, dynamic> guestOrderForm;

  factory GuestOrderForm.fromJson(Map<String, dynamic> json) =>
      _$GuestOrderFormFromJson(json);

  Map<String, dynamic> toJson() => _$GuestOrderFormToJson(this);
}
