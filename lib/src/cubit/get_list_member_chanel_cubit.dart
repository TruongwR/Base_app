import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_list_member_chanel_state.dart';

class GetListMemberChanelCubit extends Cubit<GetListMemberChanelState> {
  final ChanelRepository chanelRepository;
  GetListMemberChanelCubit({required this.chanelRepository}) : super(const GetListMemberChanelState.initial());
  void listMemberChanel(
      {required int page, required int size, String? nickname, String? status, required String chanelId}) async {
    emit(const GetListMemberChanelState.loading());
    final respon = await chanelRepository.listMemberChanel(page: page, size: size, channelId: chanelId);
    if (respon.success == true) {
      emit(GetListMemberChanelState.succes(respon.data));
    } else {
      emit(GetListMemberChanelState.failure(respon.message ?? ''));
    }
  }
}
