import 'package:json_annotation/json_annotation.dart';

part 'slot_book_request.g.dart';

@JsonSerializable()
class SlotBookRequest {
  @JsonKey(name: "start_time")
  int startTime;
  @JsonKey(name: "end_time")
  int endTime;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "booking_date")
  String bookingDate;
  @JsonKey(name: "merchant_id")
  int merchantId;

  SlotBookRequest();

  factory SlotBookRequest.fromJson(Map<String, dynamic> json) =>
      _$SlotBookRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SlotBookRequestToJson(this);
}
