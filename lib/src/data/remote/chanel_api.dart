import 'package:Whispers/src/network/api_path.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/api_response/api_response.dart';
import '../model/list_chanel_parrent_model.dart';
import '../model/message_model.dart';

part 'chanel_api.g.dart';

@RestApi()
abstract class ChanelApi {
  factory ChanelApi(Dio dio, {String? baseUrl}) = _ChanelApi;
  @GET(ApiPath.getListChanel)
  Future<ApiResponse<ListChanelParrentModel>> getListChanel(
    @Query('page') int page,
    @Query('size') int size,
    @Query('name') String? name,
    @Query('type') String? type,
    @Query('status') String status,
  );
  @GET(ApiPath.getListMesageChanel)
  Future<ApiResponse<DataMessageModel>> getListMessageChanel(
    @Query('page') int page,
    @Query('size') int size,
    @Query('content') String? content,
    @Query('channelId') String channelId,
  );
  @POST(ApiPath.checkMessages)
  Future<ApiResponse<dynamic>> checkMessages(
    @Field() String channelId,
  );
  @POST(ApiPath.createChanel)
  Future<ApiResponse<dynamic>> createChanel(
    @Field() String name,
    @Field() String type,
    @Field() String? otherHalf,
    @Field() List<String>? members,
  );
}
