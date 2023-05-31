import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/box.dart';

import 'package:base_app/src/di/injection.dart/injection.dart';
import 'package:base_app/src/features/profile/components/profile_avatar.dart';
import 'package:base_app/src/features/profile/components/profile_list_item.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
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
                      action: () => AppNavigator.push(Routes.editProfileScreen),
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
                const ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                const ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                const ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                ),
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
}
