import 'package:Whispers/src/cubit/check_messages_state.dart';
import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckMessagesCubit extends Cubit<CheckMessagesState> {
  final ChanelRepository chanelRepository;
  CheckMessagesCubit({required this.chanelRepository}) : super(const CheckMessagesState.initial());
  void checkMessages({required String chanelId}) async {
    emit(const CheckMessagesState.loading());
    final respon = await chanelRepository.checkMessages(chanelId: chanelId);
    if (respon.success == true) {
      emit(const CheckMessagesState.success());
    } else {
      emit(CheckMessagesState.failure(respon.message ?? 'không đúng chanelId'));
    }
  }
}
