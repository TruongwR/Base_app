import 'package:Whispers/src/data/model/get_list_chanel_model.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_list_chanel_state.dart';

class GetListChanelCubit extends Cubit<GetListChanelState> {
  final AuthenticationRepository authen;
  GetListChanelCubit({required this.authen}) : super(const GetListChanelState.initial());

  Future getListChanel({
    required int page,
    required int size,
    String? name,
    String? type,
    required int status,
  }) async {
    emit(const GetListChanelState.loading());
    List<String> typeStatus = ["PUBLIC", "NEW", "WAITING", "ACCEPTED", "REJECTED", "CANCELED "];
    final repo = await authen.getListChanel(page, size, name, type, typeStatus[status]);
    if (repo.data != null) {
      // GetListChanelModel getListChanelModel = GetListChanelModel.fromJson(repo.data) as Ma;
      // emit(const GetListChanelState.succes(getListChanleModel));
    } else {
      emit(GetListChanelState.failure(repo.message ?? ''));
    }
  }
}
