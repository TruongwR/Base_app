import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/edit_profile_state.dart';
import 'package:Whispers/src/features/profile/components/profile_avatar.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/share_components/app_bar/my_app_bar.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/until.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/injection.dart/injection.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController passWordOldController = TextEditingController();
  late final _formKey = GlobalKey<FormState>();
  final editProfileCubit = getIt<EditProfileCubit>();
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passWordOldController.dispose();
    passWordController.dispose();
    editProfileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 40) / 2;
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(title: 'Chỉnh sửa hồ sơ'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Center(
                      child: ProfileAvatar(
                        check: false,
                        action: () {},
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width,
                        child: MyTextField(
                          style: AppFont.t.s(16).grey68.w600,
                          title: "First Name",
                          titleStyle: AppFont.t.s(16).w600,
                          required: true,
                          hasBorder: true,
                          inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.grayBE),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          controller: firstNameController,
                          hintText: 'First Name',
                          hintStyle: AppFont.t.s(16).grey68,
                          validator: (value) {
                            if (value?.isEmpty == true || !Validators.isValiName(value ?? '')) {
                              return 'Please enter a valid First Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: width,
                        child: MyTextField(
                          style: AppFont.t.black.s(16),
                          required: true,
                          title: "Last Name",
                          titleStyle: AppFont.t.s(16).w600,
                          hasBorder: true,
                          inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.grayBE),
                          ),
                          controller: lastNameController,
                          hintText: 'Last Name',
                          hintStyle: AppFont.t.s(16).grey68,
                          validator: (value) {
                            if (value?.isEmpty == true || !Validators.isValiName(value ?? '')) {
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
                    style: AppFont.t.black.s(16),
                    required: true,
                    title: "PasswordOld",
                    titleStyle: AppFont.t.s(16).w600,
                    hasBorder: true,
                    obscureText: true,
                    inputBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.grayBE),
                    ),
                    controller: passWordOldController,
                    hintText: 'PasswordOld',
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
                  BoxMain.h(20),
                  MyTextField(
                    style: AppFont.t.s(16).grey68.w600,
                    required: true,
                    title: "Password",
                    titleStyle: AppFont.t.s(16).w600,
                    hasBorder: true,
                    obscureText: true,
                    inputBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.grayBE),
                    ),
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
                  BlocListener<EditProfileCubit, EditProfileState>(
                    bloc: editProfileCubit,
                    listener: (context, state) {
                      Logger.d('State', state.toString());
                      state.whenOrNull(
                        loading: showLoading,
                        succes: () {
                          dismissLoading();
                          AppNavigator.push(Routes.profileScreen);
                        },
                        failure: dismissLoadingShowError,
                      );
                    },
                    child: ButtonPrimary(
                      text: 'Lưu',
                      textStyle: AppFont.t.s(24).w600.white,
                      action: () {
                        _formKey.currentState!.validate() == true
                            ? editProfileCubit.updateProfile(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                passwordOld: passWordOldController.text,
                                password: passWordController.text,
                                avatarFileId: '')
                            : null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
