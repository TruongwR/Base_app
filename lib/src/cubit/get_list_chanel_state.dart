import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/get_list_chanel_model.dart';

part 'get_list_chanel_state.freezed.dart';

@freezed
class GetListChanelState with _$GetListChanelState {
  const factory GetListChanelState.initial() = _Initial;
  const factory GetListChanelState.loading() = _Loading;
  const factory GetListChanelState.succes(GetListChanelModel data) = _Succes;
  const factory GetListChanelState.failure(String error) = _Failure;
}
