///Unused this code

// class OTPVerificationModel {
//   int? status;
//   String? message;
//   Data? data;
//
//   OTPVerificationModel({this.status, this.message, this.data});
//
//   OTPVerificationModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? sId;
//   int? otp;
//
//   Data({this.sId, this.otp});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     otp = json['otp'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['otp'] = otp;
//     return data;
//   }
// }
