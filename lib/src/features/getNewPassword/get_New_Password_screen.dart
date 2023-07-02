import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/cubit/get_new_password_cubit.dart';
import 'package:Whispers/src/cubit/get_new_password_state.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../configs/Palette.dart';
import '../../di/injection.dart/injection.dart';
import '../../navigator/app_navigator.dart';
import '../../navigator/routers.dart';

class GetNewPasswordScreen extends StatelessWidget {
  const GetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController authenEmail = TextEditingController();
    GetNewPasswordCubit getNewPasswordCubit = getIt<GetNewPasswordCubit>();
    void _confirmToken() {
      var tokenList = authenEmail.text.split('/');
      if (tokenList.length == 2) {
        String id = tokenList[0];
        String activationCode = tokenList[1];
        getNewPasswordCubit.getNewPassword(id: id, activationCode: activationCode);
      } else {
        ScaffoldMessenger.of(AppNavigator.context!).showSnackBar(const SnackBar(content: Text('Token is not valid')));
      }
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderText(text: 'Xác nhận Email'),
              BoxMain.h(16),
              Text(
                'Chúng tôi đã gửi mã xác nhận vào email của bạn',
                style: AppFont.t.s(16),
                textAlign: TextAlign.center,
              ),
              BoxMain.h(40),
              MyTextField(
                labelText: 'Nhập mã xác minh:',
                labelStyle: AppFont.t.s(16),
                required: true,
                hasBorder: true,
                fillColor: Palette.grayC4,
                controller: authenEmail,
              ),
              BoxMain.h(16),
              InkWell(
                onTap: () {},
                child: Text(
                  'Gửi lại mã xác minh',
                  style: AppFont.t.s(15).underline,
                  textAlign: TextAlign.left,
                ),
              ),
              BoxMain.h(60),
              BlocListener<GetNewPasswordCubit, GetNewPasswordState>(
                bloc: getNewPasswordCubit,
                listener: (context, state) {
                  state.whenOrNull(
                      loading: showLoading,
                      succes: (data) {
                        dismissLoading();
                        showDialog(
                          barrierDismissible: false,
                          context: AppNavigator.context!,
                          builder: (context) => WillPopScope(
                            onWillPop: () async => false,
                            child: AlertDialog(
                              title: const Text('New Password! '),
                              content: Text(
                                data?.data ?? '',
                                style: AppFont.t.s(16),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('login'),
                                  onPressed: () {
                                    AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      failure: dismissLoadingShowError);
                },
                child: ButtonPrimary(
                  text: 'TIẾP TỤC',
                  textStyle: AppFont.t.s(18).white,
                  action: () {
                    _confirmToken();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
