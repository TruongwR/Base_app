import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_cubit.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_state.dart';
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
  ListMemberChanelScreen({super.key, required this.chanel, this.member});
  final Chanel chanel;
  Member? member;
  @override
  State<ListMemberChanelScreen> createState() => _ListMemberChanelScreenState();
}

class _ListMemberChanelScreenState extends State<ListMemberChanelScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  List<Member> _listMember = [];
  List<Member> _listAdmin = [];

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
                        _listAdmin.add(e);
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
                  itemBuilder: (context, index) => ChatCard(
                        isStatus: false,
                        member: _listMember[index],
                        press: () {},
                      )),
            ),
            ListView.builder(
                itemCount: _listAdmin.length,
                itemBuilder: (context, index) => ChatCard(
                      isStatus: false,
                      member: _listAdmin[index],
                      press: () {},
                    )),
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
}
