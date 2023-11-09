import 'package:json_annotation/json_annotation.dart';

part 'cancel_reason_request.g.dart';

@JsonSerializable()
class CancelReasonRequest {
  CancelReasonRequest({
    this.itemId,
    this.orderId,
    this.reason,
    this.langCode,
  });

  @JsonKey(name: 'item_id')
  dynamic itemId;
  @JsonKey(name: 'order_id')
  dynamic orderId;
  @JsonKey(name: 'reason')
  dynamic reason;
  @JsonKey(name: 'lang_code')
  dynamic langCode;

  factory CancelReasonRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReasonRequestToJson(this);
}

@JsonSerializable()
class CancelReasonForm {
  CancelReasonForm(this.cancelRequestForm);

  Map<String, dynamic> cancelRequestForm;

  factory CancelReasonForm.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonFormFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReasonFormToJson(this);
}
