import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  ChangePasswordRequest({
    this.currentPassword,
    this.newPassword,
  });

  @JsonKey(name: 'current_password')
  String? currentPassword;
  @JsonKey(name: 'new_password')
  String? newPassword;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
