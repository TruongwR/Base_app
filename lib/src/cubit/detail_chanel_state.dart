import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/message_model.dart';
part 'detail_chanel_state.freezed.dart';

@freezed
class DetailChanelState with _$DetailChanelState {
  const factory DetailChanelState.initial() = _Initial;
   const factory DetailChanelState.loading() = _Loading;
    const factory DetailChanelState.success(DataMessageModel data) = _Success;
     const factory DetailChanelState.failure(String error) = _Failure;
}
