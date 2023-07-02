import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/cubit/create_chanel_cubit.dart';
import 'package:Whispers/src/cubit/create_chanel_state.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/features/create_chanel/compontents/body_create_chanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../configs/app_fonts.dart';
import '../../configs/palette.dart';
import '../../share_components/share_componets.dart';
import '../../utils/enum/enum_status.dart';

class CreateChanelScreen extends StatefulWidget {
  const CreateChanelScreen({super.key});

  @override
  State<CreateChanelScreen> createState() => _CreateChanelScreenState();
}

class _CreateChanelScreenState extends State<CreateChanelScreen> {
  final searchController = TextEditingController();
  final nameChanelController = TextEditingController();
  int _page = 1;
  final int _size = 10;
  int _totalPage = 1;
  late ScrollController _sc;
  final CreateChanelCubit _createChanelCubit = getIt<CreateChanelCubit>();
  final ChanelListAllCubit _chanelListAllCubit = getIt<ChanelListAllCubit>();
  @override
  void initState() {
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
    _totalPage = 10;
    _chanelListAllCubit.getlistChanel(
        page: _page, size: _size, name: name, status: StatusChanel.sttaccepted.getString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: const BodyCreateChanel(),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      leading: const BackButton(),
      title: const Text('Nhóm mới'),
      backgroundColor: Palette.primary,
      actions: [
        BlocListener<CreateChanelCubit, CreateChanelState>(
          bloc: _createChanelCubit,
          listener: (context, state) {},
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Tạo',
              style: AppFont.t.hint.s(18),
            ),
          ),
        ),
      ],
      titleSpacing: 00.0,
      centerTitle: true,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      elevation: 0.00,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextField(
              autoFocus: false,
              controller: nameChanelController,
              fillColor: Palette.primary,
              style: AppFont.t.s(16).hint.w600,
              hintText: 'Tên nhóm',
              hintStyle: AppFont.t.s(16).hint,
              cursorColor: Palette.black,
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
