import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_account_state.freezed.dart';

@freezed
class ActiveAccountState with _$ActiveAccountState {
  const factory ActiveAccountState.initial() = _Initial;
  const factory ActiveAccountState.loading() = _Loading;
  const factory ActiveAccountState.succes() = _Succes;
  const factory ActiveAccountState.failure(String error) = _Failure;
}
