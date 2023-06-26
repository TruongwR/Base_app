part of './body.dart';

Widget _bodyProtected() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Thông tin về đoạn chat',
        style: AppFont.t.w500,
      ),
      BoxMain.h(16),
      columnLayout(
        onTap: () {},
        title: 'Thành viên trong đoạn chat',
        icon: Icons.groups,
      ),
      columnLayout(
        onTap: () {},
        title: 'Liên kết',
        icon: Icons.share,
      ),
      BoxMain.h(16),
      Text(
        'Thông tin đoạn chat',
        style: AppFont.t.w500,
      ),
      BoxMain.h(16),
      columnLayout(
        onTap: () {},
        title: 'Xem file & liên kết',
        icon: Icons.insert_photo_rounded,
      ),
      columnLayout(
        onTap: () {},
        title: 'Tìm kiếm trong cuộc trò chuyện',
        icon: Icons.search,
      ),
      columnLayout(
        onTap: () {},
        title: 'Âm thanh thông báo',
        icon: Icons.notifications,
      ),
      columnLayout(
        btnCheckOut: true,
        onTap: () {},
        title: 'Rời khỏi đoạn chat',
        icon: Icons.logout,
      ),
    ],
  );
}
