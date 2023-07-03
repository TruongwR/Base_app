import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/features/home/components/chat_card.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/chanel_list_all_cubit.dart';
import '../../cubit/chanel_list_all_state.dart';
import '../../data/model/list_chanel_parrent_model.dart';
import '../../di/injection.dart/injection.dart';
import '../../share_components/empty/empty.dart';
import '../../share_components/loading/loading.dart';
import '../../utils/enum/enum_status.dart';
import '../../utils/helpers/logger.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final TextEditingController searchController = TextEditingController();
  final ChanelListAllCubit _chanelListAllCubit = getIt<ChanelListAllCubit>();
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  List<Channel> _listChanel = [];
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
    _chanelListAllCubit.getlistChanel(page: _page, size: _size, type: TypeChanel.sttDEFAULT.getString());
    _page++;
  }

  void _initData() async {
    _page = 1;
    _totalPage = 1;
    _listChanel = [];
    _chanelListAllCubit.getlistChanel(page: _page, size: _size, type: TypeChanel.sttDEFAULT.getString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Danh Bạ'),
        backgroundColor: Palette.primary,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
      ),
      body: BlocListener<ChanelListAllCubit, ChanelListAllState>(
        bloc: _chanelListAllCubit,
        listener: (context, state) {
          state.maybeMap(
            orElse: () => const Empty(),
            loading: (value) => const Loading(),
            success: (value) {
              _totalPage = value.listChanel?.totalPages ?? 1;
              _listChanel.addAll(value.listChanel?.content as Iterable<Channel>);
              setState(() {});
              Logger.d("lenght", value.listChanel?.content?.length);
            },
            failure: (value) => const Empty(),
          );
        },
        child: ListView.builder(
            itemCount: _listChanel.length,
            itemBuilder: (context, index) => ChatCard(
                  type: 2,
                  isStatus: false,
                  chanel: _listChanel[index],
                  press: () => AppNavigator.push(Routes.messagesScreen, arguments: _listChanel[index]),
                )),
      ),
    ));
  }
}
