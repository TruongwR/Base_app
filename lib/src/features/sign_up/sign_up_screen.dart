import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:base_app/src/cubit/cubit/signup_cubit.dart';
import 'package:base_app/src/cubit/cubit/signup_state.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';
import 'package:base_app/src/share_components/share_componets.dart';
import 'package:base_app/src/utils/until.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../configs/box.dart';
import '../../navigator/app_navigator.dart';
import '../../navigator/routers.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final signUpCubit = getIt<SignupCubit>();

  late final _formKey = GlobalKey<FormState>();
  bool isActiveButton = false;
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passWordController.dispose();
    signUpCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 40) / 2;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width,
                        child: MyTextField(
                          title: "First Name",
                          titleStyle: AppFont.t.s(16).w600.white,
                          required: true,
                          hasBorder: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          controller: firstNameController,
                          hintText: 'First Name',
                          hintStyle: AppFont.t.s(16).grey68,
                          validator: (value) {
                            if (value?.isEmpty == true || !Validators.isValidEmail(value ?? '')) {
                              return 'Please enter a valid First Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: width,
                        child: MyTextField(
                          required: true,
                          title: "Last Name",
                          titleStyle: AppFont.t.s(16).w600.white,
                          hasBorder: true,
                          controller: lastNameController,
                          hintText: 'Last Name',
                          hintStyle: AppFont.t.s(16).grey68,
                          validator: (value) {
                            if (value?.isEmpty == true || !Validators.isValidEmail(value ?? '')) {
                              return 'Please enter a valid Last Name';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  BoxMain.h(20),
                  MyTextField(
                    required: true,
                    title: "Email",
                    titleStyle: AppFont.t.s(16).w600.white,
                    hasBorder: true,
                    controller: emailController,
                    hintText: 'Email',
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
                    required: true,
                    title: "Password",
                    titleStyle: AppFont.t.s(16).w600.white,
                    hasBorder: true,
                    obscureText: true,
                    controller: passWordController,
                    hintText: 'Password',
                    hintStyle: AppFont.t.s(16).grey68,
                    validator: (value) {
                      if ((value == null || value.isEmpty)) {
                        return 'Mật khẩu không được để trống';
                      } else if (Validators.validatePassword(value) == false) {
                        return 'Mật khẩu không thỏa mãn';
                      }
                      return null;
                    },
                  ),
                  BoxMain.h(48),
                  BlocListener<SignupCubit, SignupState>(
                    bloc: signUpCubit,
                    listener: (context, state) {
                      Logger.d('State', state.toString());
                      state.whenOrNull(
                        loading: showLoading,
                        success: () {
                          dismissLoading();
                          AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
                        },
                        failure: dismissLoadingShowError,
                      );
                    },
                    child: ButtonPrimary(
                      text: 'Sing Up',
                      textStyle: AppFont.t.s(24).w600.white,
                      action: () {
                        signUpCubit.signup(fistName: firstNameController.text, lastName: lastNameController.text, email: emailController.text, passWord: passWordController.text);
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
