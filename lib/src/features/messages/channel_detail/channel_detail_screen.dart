import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_cubit.dart';

import 'package:Whispers/src/cubit/update_chanel_cubit.dart';
import 'package:Whispers/src/cubit/update_chanel_state.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/features/messages/channel_detail/components/body.dart';
import 'package:Whispers/src/features/messages/channel_detail/components/list_icons.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/chanel_list_all_cubit.dart';
import '../../../data/model/list_chanel_parrent_model.dart';
import 'components/widget_avatar.dart';

class ChannelDetailScreen extends StatefulWidget {
  const ChannelDetailScreen({super.key, required this.chanel});
  final Channel chanel;

  @override
  State<ChannelDetailScreen> createState() => _ChannelDetailScreenState();
}

class _ChannelDetailScreenState extends State<ChannelDetailScreen> {
  late final TextEditingController nameController;
  late String selectedOption;
  final UpdateChanelCubit _updateChanelCubit = getIt<UpdateChanelCubit>();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.chanel.name);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    _updateChanelCubit.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChannelDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _showdialog(String options) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Chỉnh sửa tên nhóm',
            style: AppFont.t.s(18).black,
          ),
          content: TextField(
            controller: nameController,
            style: AppFont.t.black.w500,
          ),
          actions: [
            TextButton(
              onPressed: () => AppNavigator.pop(),
              child: Text(
                'Hủy',
                style: AppFont.t.blue,
              ),
            ),
            
            BlocListener<UpdateChanelCubit, UpdateChanelState>(
              bloc: _updateChanelCubit,
              listener: (context, state) {
                state.whenOrNull(
                    loading: () => const Loading(),
                    succes: () {
                      AppNavigator.pop();
                      BlocProvider.of<ChanelListAllCubit>(context).getlistChanel(size: 1, page: 10);
                    },
                    failure: (value) => const Empty());
              },
              child: TextButton(
                onPressed: () => _updateChanelCubit.updateChanel(
                  channelId: widget.chanel.id ?? '',
                  name: nameController.text,
                ),
                child: Text(
                  'Lưu',
                  style: AppFont.t.blue,
                ),
              ),
            ),
          ],
        ),
      );
    }

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
                onSelected: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                  _showdialog(value);
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {},
                    child: Text(
                      'Mở bong bóng chat',
                      style: AppFont.t.s(18).w500,
                    ),
                  ),
                  if (widget.chanel.type == 'PUBLIC' || widget.chanel.type == 'PROTECTED')
                    PopupMenuItem(
                      onTap: () {},
                      child: Text(
                        'Đổi ảnh mhóm',
                        style: AppFont.t.s(18).w500,
                      ),
                    ),
                  if (widget.chanel.type == 'PUBLIC' || widget.chanel.type == 'PROTECTED')
                    PopupMenuItem(
                      value: 'option 1',
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
                  if (widget.chanel.type == 'PUBLIC' || widget.chanel.type == 'PROTECTED')
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
              chekType: widget.chanel.type ?? '',
              context: context,
            ),
            BoxMain.h(8),
            Center(
              child: Text(
                widget.chanel.name ?? '',
                style: AppFont.t.s(24).w600,
              ),
            ),
            BoxMain.h(16),
            ListIcons(
              checkType: widget.chanel.type ?? '',
            ),
            BoxMain.h(32),
            Body(
              checkTypeChanel: widget.chanel.type ?? '',
              chanel: widget.chanel,
            ),
          ],
        ),
      ),
    );
  }
}
