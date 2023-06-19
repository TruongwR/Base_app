import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/cubit/chanel_list_all_state.dart';
import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/drawer/nav_drawer.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/enum/enum_status.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/app_fonts.dart';
import '../../../configs/box.dart';
import '../../../navigator/app_navigator.dart';
import '../../../navigator/routers.dart';

import '../../../share_components/shimmer/shimer_widget.dart';
import 'chat_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController searchController = TextEditingController();
  final ChanelListAllCubit _chanelListAllCubit = getIt<ChanelListAllCubit>();
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  List<Chanel> _listChanel = [];
  late ScrollController _sc;

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
    _chanelListAllCubit.getlistChanel(page: _page, size: _size, status: StatusChanel.sttaccepted.getString());
    _page++;
  }

  void _initData() async {
    _page = 1;
    _totalPage = 1;
    _listChanel = [];
    _chanelListAllCubit.getlistChanel(page: _page, size: _size, status: StatusChanel.sttaccepted.getString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const DrawerWidget(),
      endDrawer: const DrawerWidget(),
      body: SizedBox(
        height: 300,
        child: Column(
          children: [
            BlocListener<ChanelListAllCubit, ChanelListAllState>(
              bloc: _chanelListAllCubit,
              listener: (context, state) {
                state.maybeMap(
                  orElse: () => const Empty(),
                  loading: (value) => const Loading(),
                  success: (value) {
                    _totalPage = value.listChanel?.totalPages ?? 1;
                    _listChanel.addAll(value.listChanel?.content as Iterable<Chanel>);
                    setState(() {});
                    Logger.d("lenght", value.listChanel?.content?.length);
                  },
                  failure: (value) => const Empty(),
                );
              },
              child: Shimmer(
                linearGradient: linearGradientMain,
                child: Expanded(
                  child: ListView.builder(
                    controller: _sc,
                    itemCount: _listChanel.length,
                    itemBuilder: (context, index) => ChatCard(
                      isStatus: true,
                      chanel: _listChanel[index],
                      press: () => AppNavigator.push(Routes.messagesScreen, arguments: _listChanel[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Đoạn Chat'),
      backgroundColor: Palette.primary,
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_note_outlined),
          onPressed: () {},
        ),
        BoxMain.w(8),
      ],
      titleSpacing: 00.0,
      centerTitle: true,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      elevation: 0.00,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: MyTextField(
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.text = '';
                setState(() {});
              },
            ),
            prefixIcon: const Icon(Icons.search),
            required: true,
            titleStyle: AppFont.t.s(16).w600.white,
            hasBorder: true,
            style: AppFont.t.s(16).grey68.w600,
            enable: true,
            controller: searchController,
            hintText: ' Tìm kiếm',
            hintStyle: AppFont.t.s(16).grey68,
          ),
        ),
      ),
    );
  }
}
