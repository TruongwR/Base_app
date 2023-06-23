part of './list_icons.dart';

Widget _listIconsDefault() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildIcon(
        subTitle: 'Gọi thoại',
        icon: Icons.local_phone,
        onTap: () {},
      ),
      buildIcon(
        subTitle: 'Gọi video',
        icon: Icons.videocam,
        onTap: () {},
      ),
      buildIcon(
        subTitle: 'Trang cá nhân',
        icon: Icons.person_2,
        onTap: () {},
      ),
      buildIcon(
        subTitle: 'Tắt thông báo',
        icon: Icons.notifications,
        onTap: () {},
      ),
    ],
  );
}
