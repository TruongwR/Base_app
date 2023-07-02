import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/enum/enum_status.dart';
import 'update_chanel_state.dart';

class UpdateChanelCubit extends Cubit<UpdateChanelState> {
  final ChanelRepository chanelRepository;
  final ChanelListAllCubit chanelListAllCubit;
  UpdateChanelCubit({required this.chanelRepository, required this.chanelListAllCubit})
      : super(const UpdateChanelState.initial());

  void updateChanel({
    required String channelId,
    String? ownerId,
    String? avatarFileId,
    String? name,
  }) async {
    emit(const UpdateChanelState.loading());
    final respon = await chanelRepository.updateChanel(
        channelId: channelId, ownerId: ownerId, avatarFileId: avatarFileId, name: name);
    if (respon.success == true) {
      chanelListAllCubit.getlistChanel(page: 1, size: 10, status: StatusChanel.sttaccepted.getString());
      emit(const UpdateChanelState.succes());
    } else {
      emit(UpdateChanelState.failure(respon.message ?? ''));
    }
  }
}
