import 'package:Whispers/src/data/model/message_model.dart';
import 'package:Whispers/src/data/repositories/repository/chanrl_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_chanel_state.dart';

class DetailChanelCubit extends Cubit<DetailChanelState> {
  final ChanelRepository chanelRepository;
  DetailChanelCubit({required this.chanelRepository}) : super(const DetailChanelState.initial());
  void getListChanel({required int page, required int size, String? content, required String channelId}) async {
    final res = await chanelRepository.getMessage(page: page, size: size, content: content, channelId: channelId);
    if (res.success == true) {
      emit(DetailChanelState.success(res.data ?? DataMessageModel()));
    } else {
      emit(const DetailChanelState.failure("Lõi Tải đoạn Chat"));
    }
  }
}
