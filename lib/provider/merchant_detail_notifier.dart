import 'package:covidpass/models/api_response.dart';
import 'package:covidpass/models/slot.dart';
import 'package:covidpass/repository/data_repository.dart';
import 'package:flutter/foundation.dart';

class MerchantDetailNotifier with ChangeNotifier {
  List<dynamic> _availableSlots;
  bool _isRequestFinished = false;

  List<dynamic> get availableSlots => _availableSlots;
  bool get isRequestFinished => _isRequestFinished;

  MerchantDetailNotifier(int merchantId, int userId) {
    getAvailableSlots(merchantId, userId);
  }

  void getAvailableSlots(int merchantId, int userId) async {
    try {
      _isRequestFinished = false;
      notifyListeners();
      ApiResponse response =
          await DataRepository.instance.getAvailableSlots(merchantId, userId);
      _availableSlots = response.data.map((it) => Slot.fromJson(it)).toList();
      _isRequestFinished = true;
      notifyListeners();
    } catch (e) {
      print(e.message);
      _isRequestFinished = true;
      notifyListeners();
    }
  }
}
