import 'package:covidpass/enums/store_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_detail.g.dart';

@JsonSerializable()
class StoreDetail {
  String id;
  String name;
  String address;
  String distance;
  List<String> slots;
  String imageUrl;
  StoreCategory storeCategory;

  StoreDetail();

  factory StoreDetail.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailFromJson(json);
  Map<String, dynamic> toJson() => _$StoreDetailToJson(this);
}
