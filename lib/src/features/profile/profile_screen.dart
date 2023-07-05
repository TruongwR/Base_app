import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/edit_profile_state.dart';

import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/features/profile/components/profile_avatar.dart';
import 'package:Whispers/src/features/profile/components/profile_list_item.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/share_components/core_crossfade/core_cross_fade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../share_components/share_componets.dart';
import '../../utils/until.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController passWordOldController = TextEditingController();
  final EditProfileCubit _editProfileCubit = getIt<EditProfileCubit>();
  late final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          BoxMain.h(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BoxMain.w(30),
              Expanded(
                child: Column(
                  children: <Widget>[
                    ProfileAvatar(
                      action: () {},
                    ),
                    BoxMain.h(20),
                    Text(
                      "${appData.userModel?.account?.firstName} ${appData.userModel?.account?.lastName}",
                      style: AppFont.t.s(16).black,
                    ),
                    BoxMain.h(5),
                    Text(
                      '${appData.userModel?.account?.email}',
                      style: AppFont.t.w600.black,
                    ),
                    BoxMain.h(20),
                  ],
                ),
              ),
              BoxMain.w(30),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                const ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                ),
                InkWell(
                  onTap: () {
                    AppNavigator.push(Routes.addFrend);
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.person_entering_booth,
                    text: 'Add Friends',
                  ),
                ),
                const ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                CoreCrossFade(
                    icon: LineAwesomeIcons.cog,
                    text: 'Settings',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _crossfadeIterm(
                          icon: CupertinoIcons.person_crop_circle,
                          text: 'Cập nhật tên người dùng',
                          onTap: () {
                            _showBottomSheat(type: 1);
                          },
                        ),
                        BoxMain.h(16),
                        _crossfadeIterm(
                          icon: CupertinoIcons.padlock_solid,
                          text: 'Đổi mật khẩu',
                          onTap: () {
                            _showBottomSheat(type: 2);
                          },
                        ),
                      ],
                    )),
                const ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite a Friend',
                ),
                InkWell(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("Logout"),
                          actions: [
                            CupertinoDialogAction(
                                onPressed: () {
                                  AppNavigator.pop();
                                },
                                child: const Text("Cancel")),
                            CupertinoDialogAction(
                                onPressed: () async {
                                  var userInfor = await Hive.openBox('tbl_user');
                                  appData.clear();
                                  userInfor.deleteAll(["email", "passWord"]);
                                  AppNavigator.pushAndRemoveUntil(Routes.signInScreen);
                                },
                                child: Text(
                                  "OK",
                                  style: AppFont.t.s(16).w600.red,
                                )),
                          ],
                          content: const Text("Are you sure you want to log out?"),
                        );
                      },
                    );
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showBottomSheat({required int type}) {
    return showBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        height: MediaQuery.of(context).size.height * 2 / 4,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  BoxMain.w(8),
                  Text(
                    'Cập nhật thông tin',
                    style: AppFont.t.s(16).w600,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => AppNavigator.pop(),
                    child: SizedBox(
                      width: 50,
                      child: Text(
                        'Hủy',
                        style: AppFont.t.s(16).success.w600,
                      ),
                    ),
                  ),
                ],
              ),
              type == 1
                  ? MyTextField(
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
                    )
                  : MyTextField(
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
              type == 1
                  ? MyTextField(
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
                    )
                  : MyTextField(
                      style: AppFont.t.s(16).grey68.w600,
                      required: true,
                      title: "Password",
                      titleStyle: AppFont.t.s(16).w600,
                      hasBorder: true,
                      obscureText: true,
                      inputBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.background),
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
              BoxMain.h(16),
              BlocListener<EditProfileCubit, EditProfileState>(
                bloc: _editProfileCubit,
                listener: (context, state) {
                  Logger.d('State', state.toString());
                  state.whenOrNull(
                    loading: showLoading,
                    succes: () {
                      dismissLoading();
                      showDialogSuccess('Cập nhật tài khoản thành công!').then((_) {
                        AppNavigator.pop();
                        AppNavigator.pop();
                      });
                    },
                    failure: dismissLoadingShowError,
                  );
                },
                child: ButtonPrimary(
                  text: 'Lưu',
                  textStyle: AppFont.t.s(24).w600.white,
                  action: () => _formKey.currentState!.validate() == true
                      ? (type == 1
                          ? _editProfileCubit.updateProfile(firstName: firstNameController.text, lastName: lastNameController.text)
                          : _editProfileCubit.updateProfile(passwordOld: passWordOldController.text, password: passWordController.text))
                      : null,
                  //action: type ==1 ? _editProfileCubit.updateProfile(firstName: firstNameController.text, lastName: lastNameController.text) : _editProfileCubit.updateProfile(passwordOld: passWordOldController.text, password: passWordController.text),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _crossfadeIterm({required IconData icon, required String text, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Palette.grayF6,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: AppFont.t.w500,
          )
        ],
      ),
    ),
  );
}
