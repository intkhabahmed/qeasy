import 'package:json_annotation/json_annotation.dart';

part 'slot_info.g.dart';

@JsonSerializable()
class SlotInfo {
  @JsonKey(name: "start_time")
  int startTime;
  @JsonKey(name: "end_time")
  int endTime;
  @JsonKey(name: "booking_date")
  String bookingDate;

  SlotInfo();

  factory SlotInfo.fromJson(Map<String, dynamic> json) =>
      _$SlotInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SlotInfoToJson(this);
}
