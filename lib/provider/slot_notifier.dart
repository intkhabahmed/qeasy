import 'package:covidpass/models/api_response.dart';
import 'package:covidpass/models/booked_slot.dart';
import 'package:covidpass/repository/data_repository.dart';
import 'package:flutter/foundation.dart';

class SlotNotifier with ChangeNotifier {
  BookedSlot _bookedSlot;
  bool _isRequestFinished = false;

  BookedSlot get bookedSlot => _bookedSlot;
  bool get isRequestFinished => _isRequestFinished;

  SlotNotifier(int slotId) {
    getSlotInformation(slotId);
  }

  void getSlotInformation(int slotId) async {
    try {
      _isRequestFinished = false;
      notifyListeners();
      ApiResponse response =
          await DataRepository.instance.getSlotInformation(slotId);
      _bookedSlot = BookedSlot.fromJson(response.data);
      _isRequestFinished = true;
      notifyListeners();
    } catch (e) {
      print(e.message);
      _isRequestFinished = true;
      notifyListeners();
    }
  }
}
