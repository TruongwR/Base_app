import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../network/api_path.dart';
import '../model/login_model.dart';
import '../model/respone_model.dart';

part 'authentication_api.g.dart';

@RestApi()
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio, {String? baseUrl}) = _AuthenticationApi;
  @POST(ApiPath.signIn)
  Future<LoginModel> login(
    @Field() String email,
    @Field() String password,
  );
    @POST(ApiPath.singUp)
  Future<ReponeModel> singup(
    @Field() String fistName,
    @Field() String lastName,
     @Field() String email,
    @Field() String passWord,
  );
}
