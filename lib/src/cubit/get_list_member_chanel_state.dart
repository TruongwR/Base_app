import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/model/list_member_chanel_model.dart';
part 'get_list_member_chanel_state.freezed.dart';

@freezed
class GetListMemberChanelState with _$GetListMemberChanelState {
  const factory GetListMemberChanelState.initial() = _Initial;
  const factory GetListMemberChanelState.loading() = _Loading;
  const factory GetListMemberChanelState.succes(ListMemberChanelModel? listMember) = _Succes;
  const factory GetListMemberChanelState.failure(String error) = _Failure;
}
