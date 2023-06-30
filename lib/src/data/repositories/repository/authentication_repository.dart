import 'dart:io';

import 'package:Whispers/src/data/model/active_account_model.dart';
import 'package:Whispers/src/data/model/api_response/api_response.dart';
import 'package:Whispers/src/data/model/respone_update_profile_model.dart';
import 'package:flutter/material.dart';
import '../../model/fotget_password_model.dart';
import '../../model/login_model.dart';
import '../../model/respone_signup_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> login(String phone, String password);
  Future<ApiResponse<FotgetPasswordModel>> fotgetPassword(String email);
  Future<dynamic> confirmPass(String accountId);
  Future<ApiResponse<dynamic>> getNewPass(String id, String activationCode);
  Future<ResponeSignupModel> signUp(String fistName, String lastName, String email, String passWord);
  Future<ActiveAccountModel> activeAccount(String id, String activationCode);
  Future<UpdateProfileModel> updateProfile(
      String firstName, String lastName, String passwordOld, String password, String avatarFileId);
  Future<ApiResponse<dynamic>> upLoadFiles({required String files, String? access});
  Future<dynamic> downLoadFile(String idFiled);
  Future<dynamic> downAvatar(String idFiled, bool responseBase64);
}
