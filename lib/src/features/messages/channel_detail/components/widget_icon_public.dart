part of './list_icons.dart';
Widget _listIconsPublic(){
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
          subTitle: 'Thêm',
          icon: Icons.person_add,
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