part of './body.dart';

Widget _bodyDefault({Channel? chanel}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Tùy chỉnh',
        style: AppFont.t.w500,
      ),
      BoxMain.h(16),
      columnLayout(
        type: 2,
        onTap: () {},
        title: 'Chủ đề',
      ),
      columnLayout(
        type: 2,
        onTap: () {},
        title: 'Cảm xúc nhanh',
        icon: Icons.mood,
      ),
      columnLayout(
        type: 2,
        onTap: () {},
        title: 'Biệt danh',
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
        onTap: () {},
        title: 'Tạo nhóm chat với ${chanel?.name}',
        icon: Icons.groups,
      ),
      columnLayout(
        onTap: () {},
        title: 'Chia sẻ thông tin liên hệ',
        icon: Icons.share,
      ),
      columnLayout(
        btnCheckOut: true,
        onTap: () {},
        title: 'Rời khỏi đoạn chat',
        icon: Icons.logout,
      )
    ],
  );
}
