import 'package:Whispers/src/data/remote/chanel_api.dart';
import 'package:Whispers/src/data/repositories/repository/chanrl_repository.dart';

import '../../../network/base_dio.dart';
import '../../model/api_response/api_response.dart';
import '../../model/list_chanel_parrent_model.dart';

class ChanelImplement implements ChanelRepository {
  final ChanelApi chanelApi = ChanelApi(BaseDio.instance.dio);
  @override
  Future<ApiResponse<ListChanelParrentModel>> getListChanel({required int page, required int size, String? name, String? type, required String status}) {
    return chanelApi.getListChanel(page, size, name, type, status);
  }
}
