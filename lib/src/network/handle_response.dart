import 'package:dio/dio.dart';


import '../di/injection.dart/injection.dart';
import '../utils/helpers/logger.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err.type == DioErrorType.badResponse) {
      if (err.response!.statusCode == 401) {
      } else if (err.response!.statusCode == 400) {
        handler.resolve(err.response!);
      } else if (err.response!.statusCode == 500) {
        handler.resolve(err.response!);
      }
    } else if (err.type == DioErrorType.connectionTimeout) {
    } else if (err.type == DioErrorType.receiveTimeout) {
    } else {
      handler.resolve(err.response!);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      handler.resolve(response);
    } else {
      handler.resolve(response);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Logger.d('ACCESS TOKEN', appData.accessToken);
    if (appData.accessToken.isNotEmpty) {
      //   var expiration = await TokenRepository().getAccessTokenRemainingTime();
      //
      //   if (expiration.inSeconds < 60) {
      //     dio.interceptors.requestLock.lock();
      //
      //     // Call the refresh endpoint to get a new token
      //     await UserService()
      //         .refresh()
      //         .then((response) async {
      //       await TokenRepository().persistAccessToken(response.accessToken);
      //       accessToken = response.accessToken;
      //     }).catchError((error, stackTrace) {
      //       handler.reject(error, true);
      //     }).whenComplete(() => dio.interceptors.requestLock.unlock());
      //   }
      //
      options.headers['Authorization'] = 'Bearer ${appData.accessToken}';
    }

    return handler.next(options);
  }
}
