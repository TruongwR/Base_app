import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_cubit.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_state.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/list_chanel_parrent_model.dart';
import '../../data/model/list_member_chanel_model.dart';
import '../../di/injection.dart/injection.dart';
import '../../share_components/empty/empty.dart';
import '../../share_components/loading/loading.dart';
import '../../utils/helpers/logger.dart';
import '../home/components/chat_card.dart';

class ListMemberChanelScreen extends StatefulWidget {
  const ListMemberChanelScreen({super.key, required this.chanel, this.member});
  final Channel chanel;
  final Member? member;
  @override
  State<ListMemberChanelScreen> createState() => _ListMemberChanelScreenState();
}

class _ListMemberChanelScreenState extends State<ListMemberChanelScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  List<Member> _listMember = [];
  List<Member> listAdmin = [];

  late ScrollController _sc;
  final GetListMemberChanelCubit getListMemberChanelCubit = getIt<GetListMemberChanelCubit>();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _initData();
    _sc = ScrollController()
      ..addListener(() {
        if (_sc.position.pixels == _sc.position.maxScrollExtent && _page < _totalPage - 1) {
          _loadMore();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

  void _showdialog({TextEditingController? textEditingController, String? accountId}) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chỉnh sửa status',
              style: AppFont.t.s(18).w600,
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
          CupertinoDialogAction(
              onPressed: () {},
              child: Text(
                "Lưu",
                style: AppFont.t.s(16).w600.primary,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: buildAppbar(),
          body: TabBarView(controller: _tabController, children: [
            BlocListener<GetListMemberChanelCubit, GetListMemberChanelState>(
              bloc: getListMemberChanelCubit,
              listener: (context, state) {
                state.maybeMap(
                  orElse: () => const Empty(),
                  loading: (value) => const Loading(),
                  succes: (value) {
                    _totalPage = value.listMember?.totalPages ?? 1;
                    _listMember.addAll(value.listMember?.content as Iterable<Member>);
                    for (var e in _listMember) {
                      if (e.isAdmin == "YES") {
                        listAdmin.add(e);
                      }
                    }
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
                        TextEditingController(text: _listMember[index].status);
                    final String accoutId = _listMember[index].accountId ?? '';
                    return ChatCard(
                      type: 2,
                      subTitle: '${_listMember[index].status}',
                      isStatus: false,
                      member: _listMember[index],
                      press: () => _showCupertinoModalPopup(_listMember[index], textEditingController, accoutId),
                    );
                  }),
            ),
            ListView.builder(
                itemCount: listAdmin.length,
                itemBuilder: (context, index) {
                  final TextEditingController textEditingController =
                      TextEditingController(text: _listMember[index].status);
                  final String accoutId = _listMember[index].accountId ?? '';
                  return ChatCard(
                    subTitle: 'Quản trị viên',
                    type: 2,
                    isStatus: false,
                    member: listAdmin[index],
                    press: () => _showCupertinoModalPopup(listAdmin[index], textEditingController, accoutId),
                  );
                }),
          ])),
    );
  }

  buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Palette.white,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const BackButton(
          color: Palette.primary,
        ),
        const Spacer(),
        Text(
          'Thành viên',
          style: AppFont.t.w600.s(16),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Palette.primary,
          ),
        ),
      ]),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(24),
        child: TabBar(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 16),
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Palette.grayC4,
            ),
            unselectedLabelColor: Palette.black,
            tabs: const [
              Tab(
                text: 'Tất cả',
                height: 24,
              ),
              Tab(
                text: 'Quản trị viên',
                height: 24,
              )
            ]),
      ),
    );
  }

  _showCupertinoModalPopup(Member member, TextEditingController? textEditingController, String? accountId) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext cont) {
          return CupertinoActionSheet(
            actions: member.accountId != appData.userModel?.account?.id
                ? [
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: Text(
                        'Gọi video',
                        style: AppFont.t.s(16).primary,
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: Text(
                        'Gọi thoại',
                        style: AppFont.t.s(16).primary,
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        _showdialog(textEditingController: textEditingController, accountId: accountId);
                      },
                      child: Text(
                        'Status',
                        style: AppFont.t.s(16).primary,
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: Text(
                        'Nhắn tin',
                        style: AppFont.t.s(16).primary,
                      ),
                    ),
                    if (member.isAdmin == "YES")
                      CupertinoActionSheetAction(
                        onPressed: () {},
                        child: Text(
                          'Chỉ định làm quản trị viên',
                          style: AppFont.t.s(16).primary,
                        ),
                      ),
                  ]
                : [
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: Text(
                        'Xem thông tin cá nhân',
                        style: AppFont.t.s(16).primary,
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: Text(
                        'Rời khỏi nhóm',
                        style: AppFont.t.s(16).red,
                      ),
                    ),
                  ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                AppNavigator.pop();
              },
              child: Text('Hủy', style: AppFont.t.red),
            ),
          );
        });
  }
}
