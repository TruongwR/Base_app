import 'package:Whispers/src/configs/Palette.dart';
import 'package:Whispers/src/data/model/Chat.dart';
import 'package:Whispers/src/features/home/components/chat_card.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
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
                  chanel: chatsData[index],
                  press: () => AppNavigator.push(
                    Routes.messagesScreen,
                  ),
                )),
      ),
    );
  }
}
