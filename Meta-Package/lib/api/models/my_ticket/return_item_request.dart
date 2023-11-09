import 'package:json_annotation/json_annotation.dart';

part 'return_item_request.g.dart';

@JsonSerializable()
class ReturnItemRequest {
  ReturnItemRequest({
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

  factory ReturnItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnItemRequestToJson(this);
}

@JsonSerializable()
class ReturnItemForm {
  ReturnItemForm(this.returnItemForm);

  Map<String, dynamic> returnItemForm;

  factory ReturnItemForm.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemFormFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnItemFormToJson(this);
}
