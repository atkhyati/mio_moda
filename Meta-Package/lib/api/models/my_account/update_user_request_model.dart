import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';

part 'update_user_request_model.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  UpdateUserRequest({
    this.customer,
  });

  CustomerDetails? customer;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
