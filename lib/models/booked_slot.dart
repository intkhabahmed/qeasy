import 'package:covidpass/models/merchant.dart';
import 'package:covidpass/models/slot_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_slot.g.dart';

@JsonSerializable()
class BookedSlot {
  Merchant merchantInfo;
  @JsonKey(name: "slot_info")
  SlotInfo slotInfo;

  BookedSlot();

  factory BookedSlot.fromJson(Map<String, dynamic> json) =>
      _$BookedSlotFromJson(json);
  Map<String, dynamic> toJson() => _$BookedSlotToJson(this);
}
