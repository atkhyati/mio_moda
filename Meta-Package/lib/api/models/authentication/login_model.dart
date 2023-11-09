///Unused this code

// class LoginModel {
//   int? status;
//   String? message;
//   LoginData? data;
//
//   LoginModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//
//     return data;
//   }
// }
//
// class LoginData {
//   String? phoneNumber;
//   int? userType;
//   String? sId;
//   String? email;
//   String? image;
//   String? token;
//   String? refreshToken;
//   bool? isEmailVerified;
//
//   LoginData(
//       {this.phoneNumber,
//         this.userType,
//         this.sId,
//         this.email,
//         this.image,
//         this.token,
//         this.isEmailVerified,
//         this.refreshToken});
//
//   LoginData.fromJson(Map<String, dynamic> json) {
//     phoneNumber = json['phoneNumber'];
//     userType = json['userType'];
//     sId = json['_id'];
//     email = json['email'];
//     image = json['image'];
//     token = json['token'];
//     refreshToken = json['refresh_token'];
//     isEmailVerified = json['isEmailVerified'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['phoneNumber'] = phoneNumber;
//     data['userType'] = userType;
//     data['_id'] = sId;
//     data['email'] = email;
//     data['image'] = image;
//     data['token'] = token;
//     data['refresh_token'] = refreshToken;
//     data['isEmailVerified'] = isEmailVerified;
//     return data;
//   }
// }
