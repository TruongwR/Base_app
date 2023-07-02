part of './body.dart';

Widget _bodyPublic(Channel chanel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Tùy chỉnh',
        style: AppFont.t.w500.hint,
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
        onTap: () => AppNavigator.push(Routes.nicknameScreen,arguments: chanel),
        title: 'Biệt danh',
      ),
      BoxMain.h(16),
      Text(
        'Thông tin đoạn chat',
        style: AppFont.t.w500.hint,
      ),
      BoxMain.h(16),
      columnLayout(
        onTap: () => AppNavigator.push(Routes.listMemberChanelScreen, arguments: chanel),
        title: 'Xem thành viên',
        icon: Icons.groups,
      ),
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
