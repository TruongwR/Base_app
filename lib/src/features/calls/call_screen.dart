import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/data/model/Chat.dart';
import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/features/calls/components/list_calls.dart';
import 'package:Whispers/src/features/messages/message_screen.dart';
import 'package:flutter/material.dart';

import '../../share_components/drawer/nav_drawer.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(),
      drawer: const DrawerWidget(),
      endDrawer: const DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            //  BoxMain.h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Gần đây',
                  style: AppFont.t.s(18),
                ),
              ],
            ),
            BoxMain.h(10),
            Expanded(
              child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => ListCalls(
                  isStatus: true,
                  chat: chatsData[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  MessagesScreen(chanel: Chanel()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Cuộc gọi'),
      backgroundColor: Palette.primary,
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
        titleSpacing: 00.0,
      centerTitle: true,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      elevation: 0.00,
    );
  }
}
