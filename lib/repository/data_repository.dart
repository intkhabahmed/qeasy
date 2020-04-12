import 'package:covidpass/enums/user_role.dart';
import 'package:covidpass/models/api_response.dart';
import 'package:covidpass/models/user.dart';
import 'package:covidpass/services/api_service.dart';
import 'package:dio/dio.dart';

class DataRepository {
  static DataRepository _dataRepository;
  static DataRepository get instance => _dataRepository ?? DataRepository._();

  DataRepository._();

  Dio _dio;
  Dio _getDio({
    bool addToken = false,
    String contentType = "application/json",
    bool isFileOperation = false,
  }) {
    if (_dio == null) {
      _dio = Dio();
    }
    _dio.options.headers["content-type"] = contentType;
    _dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: (options) {
            if (isFileOperation) {
              options.headers["accept-encoding"] = "*";
            }
            /* if (addToken) {
          options.headers["authorization"] =
              "Bearer ${SharedPrefUtils.get(Constants.ACCESS_TOKEN)}";
        } else {
          options.headers.remove("authorization");
        } */
            return options;
          },
          onResponse: (response) {
            return response;
          },
          onError: (dioError) {}),
    );
    return _dio;
  }

  Future<ApiResponse> login(String phone, String pwd) {
    return ApiService(_getDio()).login({"phonenumber": phone, "password": pwd});
  }

  Future<ApiResponse> register(User user) {
    return ApiService(_getDio()).register(user.toJson());
  }

  Future<ApiResponse> getAllMerchants(String lat, String long) {
    return ApiService(_getDio())
        .getAllMerchants({"latitude": lat, "longitude": long});
  }

  Future<ApiResponse> getAvailableSlots(int merchantId, int userId) {
    return ApiService(_getDio())
        .getAvailableSlots({"merchant_id": merchantId, "user_id": userId});
  }

  Future<ApiResponse> bookSlot(Map<String, dynamic> slotDetails) {
    return ApiService(_getDio()).bookSlot(slotDetails);
  }

  Future<ApiResponse> getProfileInfo(String userId, UserRole userType) {
    switch (userType) {
      case UserRole.CUSTOMER:
        return ApiService(_getDio())
            .getProfileInfo({"normal_user_id": userId, "userType": userType});
        break;
      case UserRole.MERCHANT:
        return ApiService(_getDio())
            .getProfileInfo({"merchant_id": userId, "userType": userType});
        break;
      case UserRole.POLICE:
        return ApiService(_getDio())
            .getProfileInfo({"police_user_id": userId, "userType": userType});
        break;
      default:
        return null;
    }
  }

  Future<ApiResponse> getSlotInformation(int slotId) {
    return ApiService(_getDio()).getSlotInformation({"slot_id": slotId});
  }
}
