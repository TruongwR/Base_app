import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/features/messages/channel_detail/components/body.dart';
import 'package:Whispers/src/features/messages/channel_detail/components/list_icons.dart';
import 'package:flutter/material.dart';
import '../../../data/model/list_chanel_parrent_model.dart';
import 'components/widget_avatar.dart';

class ChannelDetailScreen extends StatelessWidget {
  const ChannelDetailScreen({super.key, required this.chanel});
  final Chanel chanel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const BackButton(),
              const Spacer(),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {},
                    child: Text(
                      'Mở bong bóng chat',
                      style: AppFont.t.s(18).w500,
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Text(
                      'Đổi ảnh mhóm',
                      style: AppFont.t.s(18).w500,
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Text(
                      'Đổi Tên',
                      style: AppFont.t.s(18).w500,
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Text(
                      'Xóa cuộc trò chuyện',
                      style: AppFont.t.s(18).w500,
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Text(
                      'Rời nhóm',
                      style: AppFont.t.s(18).w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            BoxMain.h(24),
            AvatarWidget(
              chekType: chanel.type ?? '',
              context: context,
            ),
            BoxMain.h(8),
            Center(
              child: Text(
                chanel.name ?? '',
                style: AppFont.t.s(24).w600,
              ),
            ),
            BoxMain.h(16),
            ListIcons(
              checkType: chanel.type ?? '',
            ),
            BoxMain.h(32),
            Body(
              checkTypeChanel: chanel.type ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
