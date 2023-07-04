
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/api_response/api_response.dart';
part 'seen_message_state.freezed.dart';
@freezed
class SeenMessageState with _$SeenMessageState {
  const factory SeenMessageState.initial() = _Initial;
   const factory SeenMessageState.loading() = _Loading;
    const factory SeenMessageState.success(ApiResponse apiResponse) = _Success;
     const factory SeenMessageState.failure() = _Failure;
}
