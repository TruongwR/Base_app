import 'package:Whispers/src/cubit/chanel_list_all_state.dart';
import 'package:Whispers/src/data/repositories/repository/chanrl_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChanelListAllCubit extends Cubit<ChanelListAllState> {
  final ChanelRepository chanelRepository;
  ChanelListAllCubit({required this.chanelRepository}) : super(const ChanelListAllState.initial());
  Future<void> getlistChanel({required int page, required int size, String? name, String? type,required String status}) async {
    emit(const ChanelListAllState.loading());
    final repon = await chanelRepository.getListChanel(page: page,size:  size,name:  name,type:   type,status:  status);
    if (repon.success == true) {
      emit(ChanelListAllState.success(repon.data));
    } else {
      emit(ChanelListAllState.failure(repon.message??"Không tải được danh sách kênh"));
    }
  }
}
