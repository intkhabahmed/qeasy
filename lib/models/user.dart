import 'package:covidpass/enums/store_category.dart';
import 'package:covidpass/enums/user_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(includeIfNull: false)
  String userId;
  UserRole userType;
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @JsonKey(includeIfNull: false)
  String firstName;
  @JsonKey(includeIfNull: false)
  String lastName;
  @JsonKey(name: "electricity_bill_number", includeIfNull: false)
  String electricityBillNumber;
  String lat;
  String long;
  String password;
  @JsonKey(name: "shop_name", includeIfNull: false)
  String shopName;
  @JsonKey(name: "shop_category", includeIfNull: false)
  StoreCategory shopCategory;
  @JsonKey(name: "gst_number", includeIfNull: false)
  String gstNumber;
  @JsonKey(name: "max_slots", includeIfNull: false)
  String maxSlots;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
