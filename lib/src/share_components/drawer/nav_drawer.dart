import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter/material.dart';

import '../../configs/app_fonts.dart';
import '../../di/injection.dart/injection.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(icon: Icons.folder, text: 'Đoạn Chat', onTap: () => Logger.d('Đoạn Chat')),
          _drawerItem(icon: Icons.group, text: 'Tin Nhắn chờ', onTap: () => Logger.d('Tin Nhắn chờ')),
          _drawerItem(icon: Icons.access_time, text: 'Kho Lưu chữ', onTap: () => Logger.d('kho Lưu chữ')),
          _drawerItem(icon: Icons.delete, text: 'Private', onTap: () => Logger.d('Private')),
          const Divider(height: 25, thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(icon: Icons.bookmark, text: 'Family', onTap: () => Logger.d('Tap Family menu')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: const ClipOval(
      child: Image(image: AssetImage('assets/images/user.png'), fit: BoxFit.cover),
    ),
    otherAccountsPictures: const [
      ClipOval(
        child: Image(image: AssetImage('assets/images/user_2.png'), fit: BoxFit.cover),
      ),
      ClipOval(
        child: Image(image: AssetImage('assets/images/user_3.png'), fit: BoxFit.cover),
      )
    ],
    accountName: Text(
      "${appData.userModel?.account?.firstName} ${appData.userModel?.account?.lastName}",
      style: AppFont.t.s(16).white.w600,
    ),
    accountEmail: Text(
      '${appData.userModel?.account?.email}',
      style: AppFont.t.w400.white,
    ),
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
