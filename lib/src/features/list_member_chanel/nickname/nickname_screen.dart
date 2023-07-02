import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/cubit/update_member_channel_cubit.dart';
import 'package:Whispers/src/cubit/update_member_channel_state.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/get_list_member_chanel_cubit.dart';
import '../../../cubit/get_list_member_chanel_state.dart';
import '../../../data/model/list_chanel_parrent_model.dart';
import '../../../data/model/list_member_chanel_model.dart';
import '../../../di/injection.dart/injection.dart';
import '../../../navigator/app_navigator.dart';
import '../../../share_components/loading/loading.dart';
import '../../../utils/helpers/logger.dart';
import '../../home/components/chat_card.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({
    super.key,
    required this.chanel,
  });
  final Chanel chanel;

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  List<Member> _listMember = [];
  late ScrollController _sc;
  final GetListMemberChanelCubit getListMemberChanelCubit = getIt<GetListMemberChanelCubit>();
  final UpdateMemberChannelCubit updateMemberChannelCubit = getIt<UpdateMemberChannelCubit>();
  @override
  void initState() {
    _initData();

    _sc = ScrollController()
      ..addListener(() {
        if (_sc.position.pixels == _sc.position.maxScrollExtent && _page < _totalPage - 1) {
          _loadMore();
        }
      });

    super.initState();
  }

  void _loadMore() {
    getListMemberChanelCubit.listMemberChanel(page: _page, size: _size, chanelId: widget.chanel.id ?? '');
    _page++;
  }

  void _initData() async {
    _page = 1;
    _totalPage = 1;
    _listMember = [];
    getListMemberChanelCubit.listMemberChanel(page: _page, size: _size, chanelId: widget.chanel.id ?? '');
  }

  void _showdialog({required TextEditingController textEditingController, required String accountId}) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chỉnh sửa biệt danh',
              style: AppFont.t.s(18).w600,
            ),
            Text(
              'Mọi người trong cùng cuộc trò chuyện',
              style: AppFont.t.hint,
            ),
            Text(
              'sẽ thấy biệt danh này.',
              style: AppFont.t.hint,
            ),
            TextField(
              controller: textEditingController,
              style: AppFont.t.w500.black,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              AppNavigator.pop();
            },
            child: Text(
              "Hủy",
              style: AppFont.t.s(16).w600.primary,
            ),
          ),
          BlocListener<UpdateMemberChannelCubit, UpdateMemberChannelState>(
            bloc: updateMemberChannelCubit,
            listener: (context, state) {
              state.whenOrNull(
                  loading: () => const Loading(),
                  succes: () {
                    AppNavigator.pop();
                  },
                  failure: dismissLoadingShowError);
            },
            child: CupertinoDialogAction(
                onPressed: () {
                  updateMemberChannelCubit.updateMemberChannel(
                      accountId: accountId, channelId: widget.chanel.id ?? '', nickname: textEditingController.text);
                },
                child: Text(
                  "Lưu",
                  style: AppFont.t.s(16).w600.primary,
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: BlocListener<GetListMemberChanelCubit, GetListMemberChanelState>(
          bloc: getListMemberChanelCubit,
          listener: (context, state) {
            state.maybeMap(
              orElse: () => const Empty(),
              loading: (value) => const Loading(),
              succes: (value) {
                _totalPage = value.listMember?.totalPages ?? 1;
                _listMember.addAll(value.listMember?.content as Iterable<Member>);

                setState(() {});
                Logger.d("lenght", value.listMember?.content?.length);
              },
              failure: (value) => const Empty(),
            );
          },
          child: ListView.builder(
              itemCount: _listMember.length,
              itemBuilder: (context, index) {
                final TextEditingController textEditingController =
                    TextEditingController(text: _listMember[index].nickname);
                final String accountId = _listMember[index].accountId ?? '';
                return ChatCard(
                  type: 2,
                  subTitle: 'Đặt biệt danh',
                  isStatus: false,
                  member: _listMember[index],
                  press: () {
                    _showdialog(textEditingController: textEditingController, accountId: accountId);
                  },
                );
              }),
        ),
      ),
    );
  }
}
