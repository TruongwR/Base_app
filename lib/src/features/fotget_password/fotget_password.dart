import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/fotget_password_cubit.dart';
import 'package:Whispers/src/cubit/fotget_password_state.dart';
import 'package:Whispers/src/gen/assets.gen.dart';
import 'package:Whispers/src/share_components/app_bar/my_app_bar.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/injection.dart/injection.dart';
import '../../navigator/app_navigator.dart';
import '../../navigator/routers.dart';

class FotgetPasswordScreen extends StatefulWidget {
  const FotgetPasswordScreen({super.key});

  @override
  State<FotgetPasswordScreen> createState() => _FotgetPasswordScreenState();
}

class _FotgetPasswordScreenState extends State<FotgetPasswordScreen> {
  TextEditingController tokenCtrl = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late final _formKey = GlobalKey<FormState>();
  final fotgetPasswordCubit = getIt<FotgetPasswordCubit>();
  @override
  void dispose() {
    emailController.dispose();
    fotgetPasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const MyAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Center(
                  child: Assets.images.fotgetPassrod.image(height: 160, width: 160),
                ),
              ),
              Text(
                'Fotgot password',
                style: AppFont.t.w600.s(24),
              ),
              BoxMain.h(5),
              Text(
                'Enter your email and we\'ll send you a link to reset ',
                style: AppFont.t.s(16),
              ),
              BoxMain.h(5),
              Text(
                'your password.',
                style: AppFont.t.s(16),
              ),
              BoxMain.h(20),
              MyTextField(
                hasBorder: true,
                style: AppFont.t.s(16).grey68.w600,
                controller: emailController,
                hintText: 'a123@gmail.com',
                hintStyle: AppFont.t.s(16).grey68,
                inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.grayBE),
                ),
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
              BlocListener<FotgetPasswordCubit, FotgetPasswordState>(
                bloc: fotgetPasswordCubit,
                listener: (context, state) {
                  Logger.d("Statues", state.toString());
                  state.whenOrNull(
                      loading: showLoading,
                      succes: (value) {
                        dismissLoading();
                        AppNavigator.pushAndRemoveUntil(Routes.getNewPassword);
                      },
                      failure: dismissLoadingShowError);
                },
                child: ButtonPrimary(
                  text: 'Tiếp Tục',
                  textStyle: AppFont.t.s(24).w600.white,
                  action: () => _formKey.currentState?.validate() == true
                      ? fotgetPasswordCubit.fotgetPassword(email: emailController.text)
                      : null,
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
