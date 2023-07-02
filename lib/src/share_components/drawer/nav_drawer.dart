import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter/material.dart';

import '../../configs/app_fonts.dart';
import '../../di/injection.dart/injection.dart';

class DrawerWidget extends StatelessWidget {
  final Function()? ontapDoanChat;
  final Function()? ontapTinNhanTro;
  final Function()? ontapMoiThamGia;
  final Function()? ontapKenhTuChoiThamGia;
  final Function()? ontapKenhDaThoat;
  const DrawerWidget({this.ontapDoanChat, this.ontapTinNhanTro, this.ontapKenhDaThoat, this.ontapKenhTuChoiThamGia, this.ontapMoiThamGia, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(icon: Icons.folder, text: 'Đoạn Chat', onTap: ontapDoanChat),
          _drawerItem(icon: Icons.add_task_outlined, text: 'Kênh được mời tham gia', onTap: ontapMoiThamGia),
          _drawerItem(icon: Icons.warning_amber_rounded, text: 'Kênh trờ phê duyệt', onTap: ontapTinNhanTro),
          _drawerItem(icon: Icons.close_rounded, text: 'Kênh đã từ chối tham gia', onTap: ontapKenhTuChoiThamGia),
          _drawerItem(icon: Icons.logout_outlined, text: 'kênh đã thoát', onTap: ontapKenhDaThoat),
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
