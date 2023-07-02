import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/cubit/chanel_list_all_state.dart';
import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/drawer/nav_drawer.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/enum/enum_status.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

import '../../../configs/Palette.dart';
import '../../../configs/app_fonts.dart';
import '../../../configs/box.dart';
import '../../../data/model/api_response/param_message_model.dart';
import '../../../navigator/app_navigator.dart';
import '../../../navigator/routers.dart';

import '../../../share_components/shimmer/my_container.dart';
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
  final int _size = 20;
  int _totalPage = 1;
  List<Channel> _listChanel = [];
  late ScrollController _sc;

  late Timer timer;

  @override
  void initState() {
    // timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   _initData(searchController.text);
    // });
    Future.delayed(const Duration(seconds: 3), () {
      _initData(searchController.text);
    });
    _initData(searchController.text);

    _sc = ScrollController()
      ..addListener(() {
        if (_sc.position.pixels == _sc.position.maxScrollExtent && _page < _totalPage - 1) {
          _loadMore();
        }
      });
    super.initState();
  }

  void _loadMore() {
    _chanelListAllCubit.getlistChanel(
        page: _page, size: _size, name: searchController.text, status: StatusChanel.sttaccepted.getString());
    _page++;
  }

  void _initData(String name) async {
    _page = 1;
    _totalPage = 1;
    _listChanel = [];
    _chanelListAllCubit.getlistChanel(
        page: _page, size: _size, name: name, status: StatusChanel.sttaccepted.getString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: DrawerWidget(
        ontapDoanChat: () => AppNavigator.pushAndRemoveUntil(Routes.newMessageScreen, arguments: 0),
        ontapTinNhanTro: () => AppNavigator.pushAndRemoveUntil(Routes.newMessageScreen, arguments: 2),
        ontapKenhDaThoat: () => AppNavigator.pushAndRemoveUntil(Routes.newMessageScreen, arguments: 4),
        ontapKenhTuChoiThamGia: () => () => AppNavigator.pushAndRemoveUntil(Routes.newMessageScreen, arguments: 3),
        ontapMoiThamGia: () => () => AppNavigator.pushAndRemoveUntil(Routes.newMessageScreen, arguments: 1),
      ),
      body: Column(
        children: [
          // StreamBuilder<SocketViewModel>(
          //   stream: appData.streamController.socketDataStream,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ChatCard(
          //         type: 1,
          //         isStatus: true,
          //         chanel: snapshot.data!.channel!,
          //         press: () => AppNavigator.push(Routes.messagesScreen, arguments: ParamMesage(chanel: snapshot.data!.channel!, chanelListAllCubit: _chanelListAllCubit)),
          //         longPress: () => buildButtomSheat(),
          //       );
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
          BlocListener<ChanelListAllCubit, ChanelListAllState>(
              bloc: _chanelListAllCubit,
              listener: (context, state) {
                state.maybeMap(
                  orElse: () => _buildLoading(),
                  loading: (value) => _buildLoading(),
                  success: (value) {
                    _totalPage = value.listChanel?.totalPages ?? 1;
                    _listChanel.addAll(value.listChanel?.content as Iterable<Channel>);
                    setState(() {});
                    Logger.d("lenght", value.listChanel?.content?.length);
                  },
                  failure: (value) => const Empty(),
                );
              },
              child: Expanded(
                child: ListView.builder(
                  controller: _sc,
                  itemCount: _listChanel.length,
                  itemBuilder: (context, index) => ChatCard(
                    type: 1,
                    isStatus: true,
                    chanel: _listChanel[index],
                    press: () => AppNavigator.push(Routes.messagesScreen, arguments: ParamMesage(chanel: _listChanel[index], chanelListAllCubit: _chanelListAllCubit)),
                    longPress: () => buildButtomSheat(),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  buildButtomSheat() {
    return showBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder(
              stream: appData.channel?.stream,
              builder: (context, snapshot) {
                Logger.d("datatesst", snapshot);
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            ),
            // Center(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(4),
            //       ),
            //     ),
            //     color: Palette.white,
            //   ),
            // ),
            _rowLayout(onTap: () {}, icon: Icons.inventory, title: 'Lưu trữ'),
            _rowLayout(onTap: () {}, icon: Icons.delete, title: 'Xóa'),
            _rowLayout(onTap: () {}, icon: Icons.notifications_off, title: 'Tắt'),
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
          onPressed: () => AppNavigator.push(Routes.createChanelScreen),
        ),
        BoxMain.w(8),
      ],
      titleSpacing: 0.0,
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
            onChanged: (value) {
              _initData(value);
            },
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.text = '';
                setState(() {});
                _initData(searchController.text);
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

  Widget _rowLayout({required Function()? onTap, required IconData icon, required String title}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: Palette.white,
          ),
          BoxMain.w(8),
          Text(
            title,
            style: AppFont.t.s(18).white,
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => MyContainer(
              leftWidget: SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 14.h,
                      borderRadius: BorderRadius.circular(8),
                      minLength: 0.2.sw,
                      maxLength: 0.5.sw,
                    )),
              ),
              rightWidget: SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 14.h,
                      alignment: Alignment.bottomRight,
                      borderRadius: BorderRadius.circular(8),
                      minLength: 0.2.sw,
                      maxLength: 0.3.sw,
                    )),
              ),
            ));
  }
}
