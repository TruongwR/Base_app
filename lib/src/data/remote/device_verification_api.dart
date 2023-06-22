import 'package:Whispers/src/data/model/api_response/api_response.dart';
import 'package:Whispers/src/network/api_path.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'device_verification_api.g.dart';

@RestApi()
abstract class DeviceVerificationApi {
  factory DeviceVerificationApi(Dio dio, {String? baseUrl}) =
      _DeviceVerificationApi;

  @GET(ApiPath.checkToken)
  Future<ApiResponse<List<String>>> checkToken();

  @PATCH(ApiPath.refestToken)
  Future<ApiResponse<List<String>>> refreshToken();

  @PATCH(ApiPath.activeDevice)
  Future<ApiResponse<dynamic>> activeDevice({
    @Field('id') required String id,
    @Field('activationCode') required String activationCode,
  });
}