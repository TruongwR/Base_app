import 'package:Whispers/src/cubit/chanel_list_all_state.dart';
import 'package:Whispers/src/data/remote/chanel_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChanelListAllCubit extends Cubit<ChanelListAllState> {
  final ChanelApi chanelApi;
  ChanelListAllCubit({required this.chanelApi}) : super(const ChanelListAllState.initial());
  Future<void> getlistChanel({required int page, required int size, String? name, String? type,required String status}) async {
    emit(const ChanelListAllState.loading());
    final repon = await chanelApi.getListChanel(page, size, name, type, status);
    if (repon.success == true) {
      emit(ChanelListAllState.success(repon.data));
    } else {
      emit(ChanelListAllState.failure(repon.message??"Không tải được danh sách kênh"));
    }
  }
}
