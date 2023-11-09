/// Unused this code.

/*
class SignupModel {
  int? status;
  String? message;
  SignupData? data;

  SignupModel({this.status, this.message, this.data});

  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SignupData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SignupData {
  int? userType;
  String? sId;
  String? email;
  String? image;
  String? token;
  String? refreshToken;
  bool? isEmailVerified;

  SignupData(
      {this.userType,
        this.sId,
        this.email,
        this.image,
        this.token,
        this.isEmailVerified,
        this.refreshToken});

  SignupData.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    sId = json['_id'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userType'] = userType;
    data['_id'] = sId;
    data['email'] = email;
    data['image'] = image;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    data['isEmailVerified'] = isEmailVerified;
    return data;
  }
}
*/
