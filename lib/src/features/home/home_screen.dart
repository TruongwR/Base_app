import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/features/calls/call_screen.dart';
import 'package:Whispers/src/features/people/people_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> listBody = [const Body(), const PeopleScreen(), const CallScreen(), const ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _selectedIndex == 0 ? buildAppBar() : null,
        body: listBody.elementAt(_selectedIndex),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: Palette.primary,
                child: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                ),
              )
            : null,
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_2_fill), label: "People"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone_circle), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Palette.primary,
      automaticallyImplyLeading: false,
      title: const Text("Chats"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
