import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/network/handle_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'api_path.dart';
import 'my_dio_logger.dart';

class BaseDio {
  static final BaseOptions _options = BaseOptions(
    contentType: 'application/json',
    receiveDataWhenStatusError: true,
    responseType: ResponseType.json,
    baseUrl: ApiPath.baseUrl,
    receiveTimeout: const Duration(seconds: 180),
    connectTimeout: const Duration(seconds: 180),
    validateStatus: (status) {
      return true;
    },
  );
  static final Dio _dio = Dio(_options);


  BaseDio._internal() {
    _dio.interceptors.add(MyDioLogger());
    _dio.interceptors.add(ResponseInterceptor());
     dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['User-Agent'] = appData.userAgent;
        return handler.next(options);
      },
    ),
  );
  }

  static final BaseDio instance = BaseDio._internal();

  Dio get dio => _dio;

}
