import 'package:json_annotation/json_annotation.dart';

part 'store_class.g.dart';

@JsonSerializable()
class Store {
  Store({
    this.id,
    this.storeName,
    this.storeImage,
  });

  @JsonKey(name: '_id')
  String? id;
  String? storeName;
  String? storeImage;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
