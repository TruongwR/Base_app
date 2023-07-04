// ignore_for_file: deprecated_member_use

import 'package:Whispers/src/data/model/api_response/api_response.dart';
import 'package:Whispers/src/data/repositories/repository/device_verification_repository.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/network/api_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../di/injection.dart/injection.dart';
import '../utils/helpers/logger.dart';

class ResponseInterceptor extends Interceptor {
  late final DeviceVerificationRepository deviceVerificationRepository =
      getIt<DeviceVerificationRepository>();

  late final tokenCtrl = TextEditingController();

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
      //       try {
      //   final AuthenticationRepository authenRepoImpl = getIt<AuthenticationRepository>();
      //   final res = await authenRepoImpl.refreshToken(appData.rfid);
      //   if (res.content != null) {
      //     appData.accessToken = res.content?.accessToken ?? '';
      //   } else {
      //     showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      //     appData.clear();
      //     AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
      //   }
      // } catch (e) {
      //   showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      //   appData.clear();
      //   AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
      // }
      // showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      // appData.clear();
      // AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
    } else {
      handler.resolve(response);
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
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
      if (options.path != ApiPath.checkToken &&
          options.path != ApiPath.refestToken &&
          options.path != ApiPath.activeDevice) {
        await checkToken();
      }
    }
    return handler.next(options);
  }

  Future<void> checkToken() async {
    final ApiResponse<List<String>> response =
        await deviceVerificationRepository.checkToken();

    if (response.errorCode == 401) {
      showDialog(
        barrierDismissible: false,
        context: AppNavigator.context!,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text('Device Activation'),
            content: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('A new token has been sent to your email'),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: tokenCtrl,
                    decoration:
                        const InputDecoration(hintText: 'Enter new token'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  var userInfor = await Hive.openBox('tbl_user');
                  appData.clear();
                  userInfor.deleteAll(["email", "passWord"]);
                  AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
                },
              ),
              TextButton(
                onPressed: _activeDevice,
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      );
      await deviceVerificationRepository.refreshToken();
    }
  }

  void _activeDevice() async {
    var tokenList = tokenCtrl.text.split('/');
    if (tokenList.length == 2) {
      String id = tokenList[0];
      String activationCode = tokenList[1];
      final response = await deviceVerificationRepository.activeDevice(
          id: id, activationCode: activationCode);
      bool status = response.success ?? false;
      if (status) {
        AppNavigator.pop();
      } else {
        _showErrorSnackBar();
      }
    } else {
      _showErrorSnackBar();
    }
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(AppNavigator.context!)
        .showSnackBar(const SnackBar(content: Text('Token is not valid')));
  }
}
