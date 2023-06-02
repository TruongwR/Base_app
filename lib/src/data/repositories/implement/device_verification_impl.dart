import 'package:Whispers/src/data/model/api_response/api_response.dart';
import 'package:Whispers/src/data/remote/device_verification_api.dart';
import 'package:Whispers/src/data/repositories/repository/device_verification_repository.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';

class DeviceVerificationImpl implements DeviceVerificationRepository {
  late final DeviceVerificationApi api = getIt<DeviceVerificationApi>();

  @override
  Future<ApiResponse<List<String>>> checkToken() {
    return api.checkToken();
  }

  @override
  Future<ApiResponse<List<String>>> refreshToken() {
    return api.refreshToken();
  }

  @override
  Future<ApiResponse<dynamic>> activeDevice({
    required String id,
    required String activationCode,
  }) {
    return api.activeDevice(id: id, activationCode: activationCode);
  }
}
