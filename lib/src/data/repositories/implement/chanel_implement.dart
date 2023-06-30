import 'package:Whispers/src/data/model/api_response/api_response.dart';

import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/data/model/list_member_chanel_model.dart';

import 'package:Whispers/src/data/model/message_model.dart';
import 'package:Whispers/src/data/remote/chanel_api.dart';
import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import '../../../network/base_dio.dart';

class ChanelImplement implements ChanelRepository {
  final ChanelApi chanelApi = ChanelApi(BaseDio.instance.dio);
  @override
  Future<ApiResponse<ListChanelParrentModel>> getListChanel(
      {required int page, required int size, String? name, String? type, required String status}) {
    return chanelApi.getListChanel(page, size, name, type, status);
  }

  @override
  Future<ApiResponse<DataMessageModel>> getMessage(
      {required int page, required int size, String? content, required String channelId}) {
    return chanelApi.getListMessageChanel(page, size, content, channelId);
  }

  @override
  Future<ApiResponse<dynamic>> checkMessages({required String channelId}) {
    return chanelApi.checkMessages(channelId);
  }

  @override
  Future<ApiResponse> createChanel(
      {required String name, required String type, String? otherHalf, List<String>? members}) {
    return chanelApi.createChanel(name, type, otherHalf, members);
  }

  @override
  Future<ApiResponse> updateChanel({required String channelId, String? ownerId, String? avatarFileId, String? name}) {
    return chanelApi.updateChanel(channelId, ownerId, avatarFileId, name);
  }

  @override
  Future<ApiResponse<ListMemberChanelModel>> listMemberChanel(
      {required int page, required int size, String? nickname, String? status, required String channelId}) {
    return chanelApi.listMemberChanel(page, size, nickname, status, channelId);
  }
}
