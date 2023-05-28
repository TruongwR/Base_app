import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../network/api_path.dart';
import '../model/login_model.dart';

part 'authentication_api.g.dart';

@RestApi()
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio, {String? baseUrl}) = _AuthenticationApi;
  @POST(ApiPath.signIn)
  Future<LoginModel> login(
    @Field() String email,
    @Field() String password,
  );
}
