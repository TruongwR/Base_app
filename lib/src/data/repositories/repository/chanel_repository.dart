import '../../model/api_response/api_response.dart';
import '../../model/list_chanel_parrent_model.dart';
import '../../model/list_member_chanel_model.dart';
import '../../model/message_model.dart';
import '../../model/param_seen_message_model.dart';

abstract class ChanelRepository {
  Future<ApiResponse<ListChanelParrentModel>> getListChanel({required int page, required int size, String? name, String? type, required String status});
  Future<ApiResponse<DataMessageModel>> getMessage({required int page, required int size, String? content, required String channelId});
  Future<ApiResponse<dynamic>> checkMessages({required String channelId});
  Future<ApiResponse<dynamic>> createChanel({required String name, required String type, String? otherHalf, List<String>? members});
  Future<ApiResponse<dynamic>> updateChanel({required String channelId, String? ownerId, String? avatarFileId, String? name});
  Future<ApiResponse<ListMemberChanelModel>> listMemberChanel({required int page, required int size, String? nickname, String? status, required String channelId});
  Future<ApiResponse<dynamic>> updateMemberChannel(
      {required String accountId, required String channelId, String? status, String? nickname, String? avatarFileId, String? avatarUrl});
  Future<ApiResponse<dynamic>> seenMessage({required ParamMessageModel paramMessageModel});
}
