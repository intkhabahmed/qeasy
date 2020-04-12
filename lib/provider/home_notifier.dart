import 'package:covidpass/models/api_response.dart';
import 'package:covidpass/models/merchant.dart';
import 'package:covidpass/repository/data_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeNotifier with ChangeNotifier {
  List<dynamic> _merchants;
  bool _isRequestFinished = false;

  List<dynamic> get merchants => _merchants;

  bool get isRequestFinished => _isRequestFinished;

  HomeNotifier(double lat, double long) {
    getAllMerchants(lat.toString(), long.toString());
    //getAllMerchants("61.243423", "130.2324");
  }

  void getAllMerchants(String lat, String long) async {
    try {
      _isRequestFinished = false;
      notifyListeners();
      ApiResponse response =
          await DataRepository.instance.getAllMerchants(lat, long);
      _merchants = response.data.map((it) => Merchant.fromJson(it)).toList();
      _isRequestFinished = true;
      notifyListeners();
    } catch (e) {
      print(e.message);
      _isRequestFinished = true;
      notifyListeners();
    }
  }
}
