import 'dart:async';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constans/api_path.dart';
import '../data/repositories/repository/authentication_repository.dart';
import '../di/injection.dart/injection.dart';
import '../navigator/app_navigator.dart';
import '../navigator/routers.dart';
import '../share_components/dialog/dialog.dart';
import '../utils/helpers/logger.dart';

class BaseDio {
  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      baseUrl: ApiPath.baseUrlApi,
      receiveTimeout: 30000,
      connectTimeout: 30000,
      validateStatus: (status) {
        return true;
      },
    );
    final dio = Dio(options);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: Logger.devLog,
      ),
    );
    dio.interceptors.add(ResponseInterceptor());

    return dio;
  }
}

class ResponseInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err.type == DioErrorType.connectTimeout) {
      showError("Không thể kết nối tới máy chủ,\n vui lòng thử lại");
    } else if (err.type == DioErrorType.receiveTimeout) {
      showError("Kết nối mạng kém,\n vui lòng thử lại");
    } else if (err.type == DioErrorType.response) {
      if (err.response?.statusCode == 406) {
        showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      }
    } else if (err.type == DioErrorType.other) {
      if (err.message.contains('Failed host lookup')) {
        showError("Không tìm thấy máy chủ, vui lòng đăng nhập lại");
      } else {
        showError("Có lỗi, vui lòng thử lại");
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      try {
        final AuthenticationRepository authenRepoImpl = getIt<AuthenticationRepository>();
        // final res = await authenRepoImpl.refreshToken(appData.rfid);
        // if (res.content != null) {
        //   appData.accessToken = res.content?.accessToken ?? '';
        // } else {
        //   showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
        //   appData.clear();
        //   AppNavigator.pushAndRemoveUntil(Routes.login);
        // }
      } catch (e) {
        showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
        appData.clear();
        AppNavigator.pushAndRemoveUntil(Routes.login);
      }
      showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      appData.clear();
      AppNavigator.pushAndRemoveUntil(Routes.login);
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
