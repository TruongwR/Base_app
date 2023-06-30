import 'package:Whispers/src/di/injection.dart/injection.dart';
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
  @override
  void initState() {
    socketHelper.connectSocket();
    super.initState();
  }

  int _selectedIndex = 0;
  List<Widget> listBody = [
    const Body(),
    const PeopleScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: listBody.elementAt(_selectedIndex),
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
}
