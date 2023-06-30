import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_chanel_state.freezed.dart';

@freezed
class CreateChanelState with _$CreateChanelState {
  const factory CreateChanelState.initial() = _Initial;
  const factory CreateChanelState.loading() = _Loading;
  const factory CreateChanelState.success() = _Success;
  const factory CreateChanelState.failure(String error) = _Failure;
}
