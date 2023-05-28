import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:base_app/src/share_components/share_componets.dart';
import 'package:base_app/src/utils/until.dart';
import 'package:flutter/material.dart';
import '../../configs/box.dart';
import '../../navigator/app_navigator.dart';
import '../../navigator/routers.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late final _formKey = GlobalKey<FormState>();
  bool isActiveButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: linearGradientMain),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: Center(
                child: Column(
                  children: [
                    BoxMain.h(40),
                    Text(
                      'Sign Up',
                      style: AppFont.t.s(28).w600.white,
                    ),
                    BoxMain.h(4),
                    Text(
                      'Create an account to start doing more',
                      style: AppFont.t.s(18).w500.white,
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    inputBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)), borderSide: BorderSide(color: Palette.white)),
                    hasBorder: true,
                    obscureText: true,
                    controller: emailController,
                    hintText: 'Phone/ Email *',
                    hintStyle: AppFont.t.s(16).grey68,
                    validator: (value) {
                      if (value?.isEmpty == true || !Validators.isValidEmail(value ?? '')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  BoxMain.h(20),
                  MyTextField(
                    hasBorder: true,
                    inputBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)), borderSide: BorderSide(color: Palette.white)),
                    obscureText: true,
                    controller: passwordController,
                    hintText: 'Password *',
                    hintStyle: AppFont.t.s(16).grey68,
                    validator: (value) {
                      if (value?.isEmpty == true || !Validators.isValidPassword(value ?? '')) {
                        return 'Invalid phone number. Use the specified format: 6 numbers';
                      }
                      return null;
                    },
                  ),
                  BoxMain.h(20),
                  MyTextField(
                    hasBorder: true,
                    inputBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)), borderSide: BorderSide(color: Palette.white)),
                    obscureText: true,
                    controller: confirmPasswordController,
                    hintText: 'ConfirmPassword *',
                    hintStyle: AppFont.t.s(16).grey68,
                    validator: (value) {
                      if (value?.isEmpty == true ||
                          !Validators.isValidPassword(value ?? '') ||
                          value?.length == passwordController.text.length && value == passwordController.text) {
                        return 'Invalid phone number. Use the specified format: 6 numbers';
                      }
                      return null;
                    },
                  ),
                  BoxMain.h(48),
                  ButtonPrimary(
                    text: 'Sing Up',
                    textStyle: AppFont.t.s(24).w600.white,
                    action: () {
                      final isValid = _formKey.currentState?.validate();
                      if (isValid == false) {
                        return;
                      }
                      AppNavigator.push(Routes.signInScreen);
                    },
                  ),
                ],
              ),
            ),
            BoxMain.h(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: AppFont.t.s(16).w500.white,
                ),
                TextButton(
                    onPressed: () => AppNavigator.push(Routes.signInScreen),
                    child: Text(
                      'Login',
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
}
