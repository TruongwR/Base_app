import '../../model/api_response/api_response.dart';

abstract class DeviceVerificationRepository {
  Future<ApiResponse<List<String>>> checkToken();

  Future<ApiResponse<List<String>>> refreshToken();

  Future<ApiResponse<dynamic>> activeDevice({
    required String id,
    required String activationCode,
  });
}
