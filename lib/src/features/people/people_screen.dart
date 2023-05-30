import 'package:base_app/src/configs/Palette.dart';
import 'package:base_app/src/data/model/Chat.dart';
import 'package:base_app/src/features/home/components/chat_card.dart';
import 'package:base_app/src/features/messages/message_screen.dart';
import 'package:base_app/src/share_components/app_bar/my_app_bar.dart';
import 'package:flutter/material.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
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
        ),
        body: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                  isStatus: false,
                  chat: chatsData[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessagesScreen(),
                    ),
                  ),
                )),
      ),
    );
  }
}
