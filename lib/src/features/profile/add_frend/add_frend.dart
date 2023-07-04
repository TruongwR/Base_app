import 'dart:async';

import 'package:Whispers/src/data/model/fotget_password_model.dart';
import 'package:Whispers/src/features/profile/add_frend/frend_item.dart';
import 'package:Whispers/src/share_components/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/share_componets.dart';

import '../../../configs/Palette.dart';
import '../../../configs/app_fonts.dart';
import '../../../cubit/fotget_password_cubit.dart';
import '../../../cubit/fotget_password_state.dart';


class AddFrend extends StatefulWidget {
  const AddFrend({Key? key}) : super(key: key);

  @override
  State<AddFrend> createState() => _AddFrendState();
}

class _AddFrendState extends State<AddFrend> {
  final FotgetPasswordCubit fotgetPasswordCubit = getIt<FotgetPasswordCubit>();
  final TextEditingController searchController = TextEditingController();

  final List<Person> _listChanel = [];

  late Timer timer;

  @override
  void initState() {
    super.initState();
  }

  void _initData(String name) async {
    fotgetPasswordCubit.fotgetPassword(email: searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          BlocListener<FotgetPasswordCubit, FotgetPasswordState>(
            bloc: fotgetPasswordCubit,
            listener: (context, state) {
              state.maybeMap(
                orElse: () => const Loading(),
                loading: (value) => const Loading(),
                succes: (value) {
                  _listChanel.addAll(value.fotgetPass?.data as Iterable<Person>);
                  setState(() {});
                },
              );
            },
            child: Expanded(
              child: ListView.builder(
                itemCount: _listChanel.length,
                itemBuilder: (context, index) => ItemFrend(
                  chanel: _listChanel[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Thêm bạn bè'),
      backgroundColor: Palette.primary,
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
}
