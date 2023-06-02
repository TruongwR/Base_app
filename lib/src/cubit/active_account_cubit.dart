import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'active_account_state.dart';

class ActiveAccountCubit extends Cubit<ActiveAccountState> {
  final AuthenticationRepository authen;
  ActiveAccountCubit({required this.authen}) : super(const ActiveAccountState.initial());
  Future activeAccount({required String id, required String activationCode}) async {
    emit(const ActiveAccountState.loading());
    final repo = await authen.activeAccount(id, activationCode);
    if (repo.success == true) {
      // AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
      emit(const ActiveAccountState.succes());
    } else {
      emit(ActiveAccountState.failure(repo.message ?? 'Kích hoạt tài khoản thất bại'));
    }
  }
}
