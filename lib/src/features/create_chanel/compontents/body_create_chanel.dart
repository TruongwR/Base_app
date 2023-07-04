import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/chanel_list_all_state.dart';
import '../../../data/model/list_chanel_parrent_model.dart';
import '../../../di/injection.dart/injection.dart';
import '../../../share_components/loading/loading.dart';
import '../../../share_components/share_componets.dart';
import '../../../utils/enum/enum_status.dart';
import '../../../utils/until.dart';
import '../../home/components/chat_card.dart';

class BodyCreateChanel extends StatefulWidget {
  const BodyCreateChanel({super.key, required this.listMember});
  final List<String> listMember;
  @override
  State<BodyCreateChanel> createState() => _BodyCreateChanelState();
}

class _BodyCreateChanelState extends State<BodyCreateChanel> {
  final ChanelListAllCubit _chanelListAllCubit = getIt<ChanelListAllCubit>();
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  List<Channel> _listChanel = [];
  late ScrollController _sc;
  bool check = false;
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

  void _addListMember(String id) {
    if (widget.listMember.contains(id)) {
      widget.listMember.remove(id);
    } else {
      widget.listMember.add('"$id"');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChanelListAllCubit, ChanelListAllState>(
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
                type: 3,
                isStatus: false,
                chanel: _listChanel[index],
                press: () {
                  
                  _addListMember(_listChanel[index].friendId ?? '');
                },
              )),
    );
  }
}
