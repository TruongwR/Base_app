import 'package:base_app/src/cubit/signup_state.dart';
import 'package:base_app/src/data/repositories/repository/authentication_repository.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenticationRepository authen;
  SignupCubit({required this.authen}) : super(const SignupState.initial());

  Future<void> signup({required String fistName, required String lastName, required String email, required String passWord}) async {
    emit(const SignupState.loading());
    final repo = await authen.signUp(fistName, lastName, email, passWord);
    if (repo.errorCode == null) {
      AppNavigator.push(Routes.signUpScreen);
      emit(const SignupState.success());
    } else {
      emit(SignupState.failure(repo.data?.email?.first ?? 'Đăng ký thất bại'));
    }
  }
}
