import 'package:Whispers/src/data/model/active_account_model.dart';
import 'package:Whispers/src/data/model/get_list_chanel_model.dart';
import 'package:Whispers/src/data/model/respone_update_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../network/api_path.dart';
import '../model/fotget_password_model.dart';
import '../model/login_model.dart';
import '../model/respone_signup_model.dart';

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
  Future<FotgetPasswordModel> fotgetPassword(@Field() String email);
  @POST(ApiPath.singUp)
  Future<ResponeSignupModel> singup(
    @Field() String fistName,
    @Field() String lastName,
    @Field() String email,
    @Field() String passWord,
  );
  @PATCH(ApiPath.activeAcount)
  Future<ActiveAccountModel> activeAcount(
    @Field() String id,
    @Field() String activationCode,
  );
  @PATCH(ApiPath.updateAcount)
  Future<UpdateProfileModel> updateProfile(
    @Field() String firstName,
    @Field() String lastName,
    @Field() String passwordOld,
    @Field() String password,
    @Field() String avatarFileId,
  );
  @GET(ApiPath.getListChanel)
  Future<GetListChanelModel> getListChanel(
 @Query('page') int page,
  @Query('size') int size,
  @Query('name') String? name,
  @Query('type') String? type,
    @Query('status') String status,
  );
}
