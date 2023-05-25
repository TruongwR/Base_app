import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:base_app/src/share_components/app_bar/my_app_bar.dart';
import 'package:base_app/src/share_components/share_componets.dart';
import 'package:base_app/src/utils/until.dart';
import 'package:flutter/material.dart';
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
                      hinText: 'Phone/ Email *',
                      hintStyle: AppFont.t.s(16).grey68,
                      validator: (value) {
                        if (value?.isEmpty == true || !Validators.isValidEmail(value ?? '')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    Box.h(20),
                    MyTextField(
                      obscureText: true,
                      controller: passwordController,
                      hinText: 'Password *',
                      hintStyle: AppFont.t.s(16).grey68,
                      validator: (value) {
                        if (value?.isEmpty == true || !Validators.isValidPassword(value ?? '')) {
                          return 'Invalid phone number. Use the specified format: 6 numbers';
                        }
                        return null;
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
                        final isValid = _formKey.currentState?.validate();
                        if (isValid == false) {
                          return;
                        }
                        AppNavigator.push(Routes.chatsScreen);
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
}
