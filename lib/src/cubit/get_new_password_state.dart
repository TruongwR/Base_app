
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/get_new_password_model.dart';

part 'get_new_password_state.freezed.dart';

@freezed
class GetNewPasswordState with _$GetNewPasswordState {
  const factory GetNewPasswordState.initial() = _Initial;
  const factory GetNewPasswordState.loading() = _Loading;
  const factory GetNewPasswordState.succes(GetNewPasswordModel? data) = _Succes;
  const factory GetNewPasswordState.failure(String error) = _Failure;
}
