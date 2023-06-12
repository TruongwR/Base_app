import '../../model/api_response/api_response.dart';
import '../../model/list_chanel_parrent_model.dart';

abstract class ChanelRepository {
  Future<ApiResponse<ListChanelParrentModel>> getListChanel({required int page, required int size, String? name, String? type, required String status});
   Future<ApiResponse<ListChanelParrentModel>> getMessage({required int page, required int size, String? content});
}
