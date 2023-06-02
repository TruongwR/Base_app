import 'package:Whispers/src/data/model/use_model.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/utils/until.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final AuthenticationRepository authen;
  LoginCubitCubit({required this.authen}) : super(const LoginCubitState.initial());
  Future login({required String email, required String passWord}) async {
    emit(const LoginCubitState.loading());
    final repo = await authen.login(email, passWord);
    if (repo.data != null) {
      var userInfor = await Hive.openBox('tbl_user');
      if (userInfor.isEmpty || userInfor.get('email') != email || userInfor.get('passWord') != passWord) {
        userInfor.put('email', email);
        userInfor.put('passWord', passWord);
      }
      appData.accessToken = repo.data!.accessToken ?? '';
      appData.refestToken = repo.data!.refreshToken ?? '';
      UserModel userModel = UserModel.fromJson(JwtDecoder.decode(repo.data!.accessToken!));
      Logger.d("User", userModel.toString());
      appData.userModel = userModel;
      AppNavigator.pushAndRemoveUntil(Routes.homeScreen);

      emit(LoginCubitState.success(userModel));
    } else {
      AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
      emit(const LoginCubitState.failure('Đăng nhập thất bại'));
    }
  }
}
