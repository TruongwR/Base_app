import 'package:Whispers/src/data/model/active_account_model.dart';
import 'package:Whispers/src/data/model/api_response/api_response.dart';
import 'package:Whispers/src/data/model/respone_update_profile_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

import '../../network/api_path.dart';
import '../model/fotget_password_model.dart';
import '../model/login_model.dart';
import '../model/respone_signup_model.dart';
import '../model/use_model.dart';

part 'authentication_api.g.dart';

@RestApi()
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio, {String? baseUrl}) = _AuthenticationApi;
  @POST(ApiPath.signIn)
  Future<LoginModel> login(
    @Field() String email,
    @Field() String password,
  );
  @POST(ApiPath.searchAcoutByEmail)
  Future<ApiResponse<Account>> fotgetPassword(@Field() String emails);
  @POST(ApiPath.register)
  Future<dynamic> confrimPass(
    @Query('accountId') String accountId,
  );

  @POST(ApiPath.getNewPass)
  Future<ApiResponse<dynamic>> getNewPass(
    @Field() String id,
    @Field() String activationCode,
  );
  @POST(ApiPath.singUp)
  Future<ResponeSignupModel> singup(
    @Field() String fistName,
    @Field() String lastName,
    @Field() String email,
    @Field() String password,
  );
  @PATCH(ApiPath.activeAcount)
  Future<ActiveAccountModel> activeAcount(
    @Field() String id,
    @Field() String activationCode,
  );
  @PATCH(ApiPath.updateAcount)
  Future<UpdateProfileModel> updateProfile(
    @Field() String? firstName,
    @Field() String? lastName,
    @Field() String? passwordOld,
    @Field() String? password,
    @Field() String? avatarFileId,
  );
  @POST(ApiPath.upLoadFile)
  Future<ApiResponse<dynamic>> upLoadFile(
    @Query('files') String files,
    @Query('access') String? access,
  );
  @GET(":9999/file/{idFiled}")
  Future<dynamic> downLoadFile(@Path("idFiled") String idFiled);
  @GET(":9999/file/{idFiled}")
  Future<dynamic> downAvatar(
    @Path("idFiled") String idFiled,
    @Query('responseBase64') bool responseBase64,
  );
}
