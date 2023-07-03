import 'dart:convert';

import 'package:Whispers/src/data/model/fotget_password_model.dart';
import 'package:Whispers/src/data/model/use_model.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fotget_password_state.dart';

class FotgetPasswordCubit extends Cubit<FotgetPasswordState> {
  final AuthenticationRepository authen;
  FotgetPasswordCubit({required this.authen}) : super(const FotgetPasswordState.initial());
  Future fotgetPassword({required String emails}) async {
    emit(const FotgetPasswordState.loading());
    final repo = await authen.fotgetPassword(emails);
    if (repo.success == true) {
      Account account = Account.fromJson(jsonDecode(repo.data.toString()) as Map<String, dynamic>);
      await authen.confirmPass(account.id ?? '');
      emit(FotgetPasswordState.succes(repo.data));
    } else {
      emit(FotgetPasswordState.failure(repo.message ?? ''));
    }
  }
}
