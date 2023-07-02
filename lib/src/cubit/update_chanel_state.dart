
import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_chanel_state.freezed.dart';

@freezed
class UpdateChanelState with _$UpdateChanelState {
  const factory UpdateChanelState.initial() = _Initial;
  const factory UpdateChanelState.loading() = _Loading;
  const factory UpdateChanelState.succes() = _Succes;
  const factory UpdateChanelState.failure(String error) = _Failure;
}
