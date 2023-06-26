import 'package:freezed_annotation/freezed_annotation.dart';


part 'check_messages_state.freezed.dart';

@freezed
class CheckMessagesState with _$CheckMessagesState {
  const factory CheckMessagesState.initial() = _Initial;
  const factory CheckMessagesState.loading() = _Loading;
  const factory CheckMessagesState.success() = _Success;
  const factory CheckMessagesState.failure(String error) = _Failure;
}
