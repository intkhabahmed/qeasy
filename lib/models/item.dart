import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  int id;
  String itemValue;

  Item();

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
