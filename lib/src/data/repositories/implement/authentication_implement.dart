import 'package:Whispers/src/data/model/active_account_model.dart';
import 'package:Whispers/src/data/model/api_response/api_response.dart';
import 'package:Whispers/src/data/model/fotget_password_model.dart';
import 'package:Whispers/src/data/model/respone_update_profile_model.dart';
import 'package:Whispers/src/network/base_dio.dart';

import '../../model/login_model.dart';
import '../../model/respone_signup_model.dart';
import '../../model/use_model.dart';
import '../../remote/authentication_api.dart';
import '../repository/authentication_repository.dart';

class AuthenRepoImpl implements AuthenticationRepository {
  final AuthenticationApi authenticationApi = AuthenticationApi(BaseDio.instance.dio);
  @override
  Future<LoginModel> login(String phone, String password) {
    return authenticationApi.login(phone, password);
  }

  @override
  Future<FotgetPasswordModel> fotgetPassword(String email) {
    return authenticationApi.fotgetPassword([email], []);
  }

  @override
  Future confirmPass(String accountId) {
    return authenticationApi.confrimPass(accountId);
  }

  @override
  Future<ApiResponse> getNewPass(String id, String activationCode) {
    return authenticationApi.getNewPass(id, activationCode);
  }

  @override
  Future<ResponeSignupModel> signUp(String fistName, String lastName, String email, String password) {
    return authenticationApi.singup(fistName, lastName, email, password);
  }

  @override
  Future<ActiveAccountModel> activeAccount(String id, String activationCode) {
    return authenticationApi.activeAcount(id, activationCode);
  }

  @override
  Future<UpdateProfileModel> updateProfile({String? firstName, String? lastName, String? passwordOld, String? password, String? avatarFileId}) {
    return authenticationApi.updateProfile(firstName, lastName, passwordOld, password, avatarFileId);
  }

  @override
  Future<ApiResponse<dynamic>> upLoadFiles({required String files, String? access}) {
    return authenticationApi.upLoadFile(files, access);
  }

  @override
  Future downLoadFile(String idFiled) {
    return authenticationApi.downLoadFile(idFiled);
  }

  @override
  Future downAvatar(String idFiled, bool responseBase64) {
    return authenticationApi.downAvatar(idFiled, responseBase64);
  }
}
