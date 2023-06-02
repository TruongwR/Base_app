
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_state_state.freezed.dart';

@freezed
class ResponseStateState<T> with _$ResponseStateState {
  const factory ResponseStateState.initial() = _Initial;
  const factory ResponseStateState.loading() = _Loading;
  const factory ResponseStateState.success(T? data) = _Success;
  const factory ResponseStateState.failed(String message) = _Failed;
}
