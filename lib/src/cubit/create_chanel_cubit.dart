import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_chanel_state.dart';

class CreateChanelCubit extends Cubit<CreateChanelState> {
  final ChanelRepository chanelRepository;
  CreateChanelCubit({required this.chanelRepository}) : super(const CreateChanelState.initial());
  void createChanel({required String name, required String type, String? otherHalf, List<String>? members}) async {
    emit(const CreateChanelState.loading());
    final respon = await chanelRepository.createChanel(name: name, type: type, otherHalf: otherHalf, members: members);
    if (respon.success == true) {
      emit(const CreateChanelState.success());
    } else {
      emit(CreateChanelState.failure(respon.message ?? ''));
    }
  }
}
