import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:base_app/src/cubit/cubit/login_cubit_cubit.dart';
import 'package:base_app/src/cubit/cubit/login_cubit_state.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:base_app/src/share_components/share_componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../configs/box.dart';
import '../../utils/extension/hive_location.dart';
import '../../utils/helpers/logger.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isActiveButton = false;
  late final _formKey = GlobalKey<FormState>();
  final loginCubit = getIt<LoginCubitCubit>();

  LocationHevi? userInfoHive;
  @override
  void initState() {

    super.initState();
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          gradient: linearGradientMain,
        ),
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: size.height / 8,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'WELCOME!\n',
                    style: AppFont.t.s(32).w600.white,
                    children: [
                      TextSpan(
                        text: 'Sign in to continue ',
                        style: AppFont.t.s(18).w500.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    hasBorder: true,
                    style: AppFont.t.s(16).grey68.w600,
                    enable: true,
                    controller: emailController,
                    hintText: ' Email *',
                    hintStyle: AppFont.t.s(16).grey68,
                    validator: (value) {
                      RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                      if ((value == null || value.isEmpty)) {
                        return 'Không được để trống';
                      } else if (value.isNotEmpty && !regex.hasMatch(value)) {
                        return 'Giá trị không hợp lệ';
                      }
                      return null;
                    },
                  ),
                  BoxMain.h(20),
                  MyTextField(
                    hasBorder: true,
                    maxLength: 20,
                    enable: true,
                    obscureText: true,
                    style: AppFont.t.s(16).grey68.w600,
                    controller: passwordController,
                    hintText: 'Password *',
                    hintStyle: AppFont.t.s(16).grey68,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validator: (value) {
                      if (validatePassword(passwordController.text) == false) {
                        return 'Mật khẩu không thỏa mãn';
                      } else {
                        return null;
                      }
                    },
                  ),
                  BoxMain.h(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget password?',
                            style: AppFont.t.s(16).underline.white.w600,
                          )),
                    ],
                  ),
                  BoxMain.h(20),
                  BlocListener<LoginCubitCubit, LoginCubitState>(
                    bloc: loginCubit,
                    listener: (context, state) {
                      Logger.d('State', state.toString());
                      state.whenOrNull(
                        loading: showLoading,
                        success: (user) {
                          dismissLoading();
                           AppNavigator.pushAndRemoveUntil(Routes.homeScreen);
                        },
                        failure: dismissLoadingShowError,
                      );
                    },
                    child: ButtonPrimary(
                      text: 'Login',
                      textStyle: AppFont.t.s(24).w600.white,
                      action: () {
                        validate();
                        _formKey.currentState?.validate() == true ? loginCubit.login(email: emailController.text, passWord: passwordController.text) : null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            BoxMain.h(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have a account?',
                  style: AppFont.t.s(16).w500.white,
                ),
                TextButton(
                    onPressed: () => AppNavigator.push(Routes.signUpScreen),
                    child: Text(
                      'Sign up',
                      style: AppFont.t.s(18).w500.success,
                    ))
              ],
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  bool validatePassword(String password) {
    if (password.length < 8) {
      return false;
    }
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp digitRegex = RegExp(r'[0-9]');
    if (!uppercaseRegex.hasMatch(password) || !lowercaseRegex.hasMatch(password) || !digitRegex.hasMatch(password)) {
      return false;
    }
    return true;
  }

  void validate() {
    _formKey.currentState!.validate() ? true : false;
  }
}
