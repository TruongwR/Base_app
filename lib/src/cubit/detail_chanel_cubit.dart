import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_chanel_state.dart';

class DetailChanelCubit extends Cubit<DetailChanelState> {
  final ChanelRepository chanelRepository;
  DetailChanelCubit({required this.chanelRepository}) : super(const DetailChanelState.initial());
  Future getMessage({required int page, required int size, String? content}) async {
    emit(const DetailChanelState.loading());
    final repon = await chanelRepository.getMessage(page: page, size: size, content: content);
    if (repon.success == true) {
      emit(DetailChanelState.success(repon.data));
    } else {
      emit(DetailChanelState.failure(repon.message ?? 'không tải được message'));
    }
  }
}
