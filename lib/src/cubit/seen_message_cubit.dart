import 'package:Whispers/src/cubit/seen_message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/param_seen_message_model.dart';
import '../data/repositories/repository/chanel_repository.dart';

class SeenMessageCubit extends Cubit<SeenMessageState> {
  final ChanelRepository chanelRepository;
  SeenMessageCubit({required this.chanelRepository}) : super(const SeenMessageState.initial());
  Future<void> seenMessage(ParamMessageModel paramMessageModel) async {
    emit(const SeenMessageState.loading());
    final repo = await chanelRepository.seenMessage(paramMessageModel: paramMessageModel);
    if (repo.success == true) {
      emit(SeenMessageState.success(repo));
    } else {
      emit(const SeenMessageState.initial());
    }
  }
}
