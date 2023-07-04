import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fotget_password_state.dart';

class FotgetPasswordCubit extends Cubit<FotgetPasswordState> {
  final AuthenticationRepository authen;
  FotgetPasswordCubit({required this.authen}) : super(const FotgetPasswordState.initial());
  Future fotgetPassword({required String email}) async {
    emit(const FotgetPasswordState.loading());
    final repo = await authen.fotgetPassword(email);
    if (repo.success == true ) {
      await authen.confirmPass((repo.data??[]).first.id ?? '');
      emit(FotgetPasswordState.succes(repo));
    } else {
      emit(const FotgetPasswordState.failure('không tìm thấy tài khoản'));
    }
  }
}
