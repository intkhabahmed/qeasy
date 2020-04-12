import 'package:covidpass/enums/store_category.dart';
import 'package:covidpass/models/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant.g.dart';

@JsonSerializable()
class Merchant {
  int merchantId;
  String shopName;
  StoreCategory shopCategory;
  String avgTime;
  String maxPeoplePerSlot;
  String lat;
  String long;
  List<Item> items;

  Merchant();

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}
