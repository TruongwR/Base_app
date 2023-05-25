import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:base_app/src/share_components/app_bar/my_app_bar.dart';
import 'package:base_app/src/share_components/share_componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../configs/box.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(title: 'Sign In'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 8,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'WELCOME!\n',
                      style: AppFont.t.s(28).w600.blue00A9E7,
                      children: [
                        TextSpan(text: 'Sign in to continue ', style: AppFont.t.s(16).w500),
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
                      controller: emailController,
                      hintText: ' Email *',
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'))],
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
                    Box.h(20),
                    MyTextField(
                      obscureText: true,
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
                    Box.h(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget password?',
                              style: AppFont.t.s(16).underline,
                            )),
                      ],
                    ),
                    Box.h(40),
                    ButtonPrimary(
                      text: 'Login',
                      textStyle: AppFont.t.s(24).w600.white,
                      action: () {
                        validate();
                        _formKey.currentState?.validate() == true ? AppNavigator.push(Routes.chatsScreen) : null;
                      },
                    ),
                  ],
                ),
              ),
              Box.h(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have a account?',
                    style: AppFont.t.s(16).w500,
                  ),
                  TextButton(
                      onPressed: () => AppNavigator.push(Routes.signUpScreen),
                      child: Text(
                        'Sign up',
                        style: AppFont.t.s(18).w500.blue00A9E7,
                      ))
                ],
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
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
