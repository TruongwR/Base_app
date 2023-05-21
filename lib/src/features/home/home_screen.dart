import 'package:base_app/src/configs/box.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../share_components/app_bar/my_app_bar.dart';
import '../../share_components/scaffold/my_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      backgroundColor: Palette.primary,
      appBar: const MyAppBar(
        title: "Chat",
      ),
      bodyApp: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: Column(
          children: [
            Box.h(180.h),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Palette.white),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
