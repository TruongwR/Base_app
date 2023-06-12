import 'package:Whispers/src/data/model/active_account_model.dart';
import 'package:Whispers/src/data/model/respone_update_profile_model.dart';

import '../../model/fotget_password_model.dart';
import '../../model/login_model.dart';
import '../../model/respone_signup_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> login(String phone, String password);
  Future<FotgetPasswordModel> fotgetPassword(String email);
  Future<ResponeSignupModel> signUp(String fistName, String lastName, String email, String passWord);
  Future<ActiveAccountModel> activeAccount(String id, String activationCode);
  Future<UpdateProfileModel> updateProfile(
      String firstName, String lastName, String passwordOld, String password, String avatarFileId);
}
