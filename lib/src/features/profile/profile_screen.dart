import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/box.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:base_app/src/features/profile/components/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(top: 30),
                      child: Stack(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                heightFactor: 15,
                                widthFactor: 15,
                                child: Icon(
                                  LineAwesomeIcons.pen,
                                  color: Palette.black,
                                  size: ScreenUtil().setSp(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BoxMain.h(20),
                    Text(
                      'Nicolas Adams',
                      style: AppFont.t.s(16).black,
                    ),
                    BoxMain.h(5),
                    Text(
                      'nicolasadams@gmail.com',
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
              children: const <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite a Friend',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
