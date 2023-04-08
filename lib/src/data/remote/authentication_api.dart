import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constans/api_path.dart';
import '../model/login_model.dart';

part 'authentication_api.g.dart';

@RestApi()
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio, {String? baseUrl}) = _AuthenticationApi;
  @POST(ApiPath.login)
  Future<LoginModel> login(
    @Field() String usename,
    @Field() String password,
  );
}
