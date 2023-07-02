import 'package:Whispers/src/cubit/get_list_member_chanel_cubit.dart';
import 'package:Whispers/src/cubit/update_member_channel_state.dart';
import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMemberChannelCubit extends Cubit<UpdateMemberChannelState> {
  final ChanelRepository chanelRepository;
  // final GetListMemberChanelCubit getListMemberChanelCubit;
  UpdateMemberChannelCubit({required this.chanelRepository}) : super(const UpdateMemberChannelState.initial());
  void updateMemberChannel(
      {required accountId,
      required String channelId,
      String? status,
      String? nickname,
      String? avatarFileId,
      String? avatarUrl}) async {
    emit(const UpdateMemberChannelState.loading());
    final respon = await chanelRepository.updateMemberChannel(
      accountId: accountId,
      channelId: channelId,
      status: status,
      nickname: nickname,
      avatarFileId: avatarFileId,
      avatarUrl: avatarUrl,
    );
    if (respon.success == true) {
      // getListMemberChanelCubit.listMemberChanel(page: 1, size: 10, chanelId: chanel.id ?? '');
      emit(const UpdateMemberChannelState.succes());
    } else {
      emit(UpdateMemberChannelState.failure(respon.message ?? ''));
    }
  }
}
