import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_chanel_state.dart';

class UpdateChanelCubit extends Cubit<UpdateChanelState> {
  final ChanelRepository chanelRepository;
  UpdateChanelCubit({required this.chanelRepository}) : super(const UpdateChanelState.initial());

  void updateChanel({required String channelId, String? ownerId, String? avatarFileId, String? name}) async {
    emit(const UpdateChanelState.loading());
    final respon = await chanelRepository.updateChanel(
        channelId: channelId, ownerId: ownerId, avatarFileId: avatarFileId, name: name);
    if (respon.success == true) {
      AppNavigator.popPush(Routes.homeScreen);
      emit(const UpdateChanelState.succes());
    } else {
      emit(UpdateChanelState.failure(respon.message ?? ''));
    }
  }
}
