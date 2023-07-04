import 'package:Whispers/src/network/api_path.dart';
import 'package:dio/dio.dart';

import '../model/file_response_model.dart';

class UploadFileApi {
  final Dio dio;
  UploadFileApi(this.dio);

  Future<FileResponseModel> upload(String path, String name, String access) async {
    String fileName = path.split('/').last;
    FormData formData = FormData.fromMap({"files": await MultipartFile.fromFile(path, filename: fileName), "access": access});
    final response = await dio.post(ApiPath.upLoadFile, data: formData);
    return response.data;
  }
}
