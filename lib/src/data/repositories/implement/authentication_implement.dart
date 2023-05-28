

import 'package:base_app/src/network/base_dio.dart';

import '../../model/login_model.dart';
import '../../remote/authentication_api.dart';
import '../repository/authentication_repository.dart';

class AuthenRepoImpl implements AuthenticationRepository {
  final AuthenticationApi authenticationApi= AuthenticationApi(BaseDio.instance.dio);
  @override
  Future<LoginModel> login(String phone, String password) {
    return authenticationApi.login(phone, password);
  }


}
