
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.folder,
              text: 'My Files',
              onTap: () => print('Tap My Files')),
          _drawerItem(
              icon: Icons.group,
              text: 'Shared with me',
              onTap: () => print('Tap Shared menu')),
          _drawerItem(
              icon: Icons.access_time,
              text: 'Recent',
              onTap: () => print('Tap Recent menu')),
          _drawerItem(
              icon: Icons.delete,
              text: 'Trash',
              onTap: () => print('Tap Trash menu')),
          const Divider(height: 25, thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.bookmark,
              text: 'Family',
              onTap: () => print('Tap Family menu')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('assets/images/orang2.jpeg'), fit: BoxFit.cover),
    ),
    otherAccountsPictures: [
      ClipOval(
        child: Image(
            image: AssetImage('assets/images/orang1.jpg'), fit: BoxFit.cover),
      ),
      ClipOval(
        child: Image(
            image: AssetImage('assets/images/orang3.jpeg'), fit: BoxFit.cover),
      )
    ],
    accountName: Text('Belajar Flutter'),
    accountEmail: Text('hallo@belajarflutter.com'),
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
            text??"",
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