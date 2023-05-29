import '../../model/login_model.dart';
import '../../model/respone_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> login(String phone, String password);
 Future<ReponeModel> signUp(String fistName, String lastName,String email, String passWord );

}