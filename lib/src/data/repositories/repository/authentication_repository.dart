import '../../model/login_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> login(String phone, String password);
 

}