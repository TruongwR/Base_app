import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../configs/box.dart';
import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({required this.idMessage,Key? key}) : super(key: key);
  final String idMessage;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
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
                "Kristin Watson",
                style: AppFont.t,
              ),
              Text("Active 3m ago", style: AppFont.t.s(12))
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
