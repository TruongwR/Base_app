import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/list_chanel_parrent_model.dart';
part 'chanel_list_all_state.freezed.dart';

@freezed
class ChanelListAllState with _$ChanelListAllState {
  const factory ChanelListAllState.initial() = _Initial;
  const factory ChanelListAllState.loading() = _Loading;
  const factory ChanelListAllState.success(ListChanelParrentModel? listChanel) = _Success;
  const factory ChanelListAllState.failure(String error) = _Failure;
}
