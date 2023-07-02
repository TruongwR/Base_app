import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_member_channel_state.freezed.dart';

@freezed
class UpdateMemberChannelState with _$UpdateMemberChannelState {
  const factory UpdateMemberChannelState.initial() = _Initial;
  const factory UpdateMemberChannelState.loading() = _Loading;
  const factory UpdateMemberChannelState.succes() = _Succes;
  const factory UpdateMemberChannelState.failure(String error) = _Failure;
}
