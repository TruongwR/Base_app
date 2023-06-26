import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_new_password_state.dart';

class GetNewPasswordCubit extends Cubit<GetNewPasswordState> {
  final AuthenticationRepository authen;
  GetNewPasswordCubit({required this.authen}) : super(const GetNewPasswordState.initial());
  Future<void> getNewPassword({required String id, required String activationCode}) async {
    emit(const GetNewPasswordState.loading());
    // final respon = await authen.getNewPassword(id, activationCode);
    // if (respon.data != null) {
    //   emit(GetNewPasswordState.succes(respon.data));
    // } else {
    //   emit(GetNewPasswordState.failure(respon.message ?? ''));
    // }
  }
}
