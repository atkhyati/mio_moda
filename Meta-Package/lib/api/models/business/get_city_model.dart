/// Unused this code

/*
class GetCityModel {
  GetCityModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<CityData>? data;

  factory GetCityModel.fromJson(Map<String, dynamic> json) => GetCityModel(
    status: json["status"] ?? 0,
    message: json["message"] ?? "",
    data: json["data"] == null
        ? null
        : List<CityData>.from(
        json["data"].map((x) => CityData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status ?? 0,
    "message": message ?? "",
    "data": data == null
        ? null
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CityData {
  CityData({
    this.id,
    this.city,
  });

  String? id;
  String? city;

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    id: json["_id"] ?? "",
    city: json["city"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id ?? "",
    "city": city ?? "",
  };
}*/
