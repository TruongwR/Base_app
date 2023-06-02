import 'package:Whispers/src/data/model/use_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_cubit_state.freezed.dart';

@freezed
class LoginCubitState with _$LoginCubitState {
  const factory LoginCubitState.initial() = _Initial;
  const factory LoginCubitState.loading() = _Loading;
  const factory LoginCubitState.success(UserModel userModel) = _Succes;
  const factory LoginCubitState.failure(String error) = _Failure;
}
