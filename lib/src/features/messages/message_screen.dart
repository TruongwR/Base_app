import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/cubit/detail_chanel_state.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:Whispers/src/share_components/share_componets.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/box.dart';
import '../../cubit/detail_chanel_cubit.dart';
import '../../data/model/list_chanel_parrent_model.dart';
import '../../data/model/message_model.dart';
import '../../share_components/time/time_extension.dart';
import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({required this.chanel, Key? key}) : super(key: key);
  final Chanel chanel;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final DetailChanelCubit detailChanelCubit = getIt<DetailChanelCubit>();

  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  TextEditingController contenController = TextEditingController();
  List<ContentMessage> _listMessageChanel = [];
  late ScrollController _sc;
  List<Viewer> _viewer = [];
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
    detailChanelCubit.getListChanel(page: _page, size: _size, content: contenController.text, channelId: widget.chanel.id ?? '');
    _page++;
  }

  void _initData() async {
    _page = 1;
    _totalPage = 1;
    _listMessageChanel = [];
    _viewer = [];
    detailChanelCubit.getListChanel(page: _page, size: _size, content: contenController.text, channelId: widget.chanel.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailChanelCubit, DetailChanelState>(
      bloc: detailChanelCubit,
      listener: (context, state) {
        state.maybeMap(
          orElse: () => const Empty(),
          loading: (value) => const Loading(),
          failure: (value) => const Empty(),
          success: (value) {
            _totalPage = value.data.message?.totalPages ?? 1;
            _viewer.addAll(value.data.viewer as Iterable< Viewer>);
            _listMessageChanel.addAll(value.data.message?.content as Iterable<ContentMessage>);
            setState(() {});
            Logger.d("lenght", _listMessageChanel.length);
          },
        );
      },
      child: Scaffold(appBar: buildAppBar(), body: Body(listDetail: _listMessageChanel,listViewer: _viewer,)),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          BoxMain.w(6 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chanel.name ?? '',
                style: AppFont.t.w600.white,
              ),
              Text(
                  "Hoạt động ${calculateTimeDifference(DateTime.fromMillisecondsSinceEpoch(widget.chanel.lastMessage?.updatedTime ?? 0).toLocal(), DateTime.now().toLocal())} trước",
                  style: AppFont.t.s(12).white)
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
        BoxMain.w(8),
      ],
    );
  }
}
