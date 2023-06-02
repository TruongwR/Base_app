import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:flutter/material.dart';

import '../../configs/Palette.dart';
import '../../configs/app_fonts.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.showBackWidget, this.subTitle, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);
  final bool? showBackWidget;
  final String title;
  final String? subTitle;
  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  final Size preferredSize;
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Palette.primary,
        ),
      ),
      elevation: 4,
      centerTitle: true,
      leading: (widget.showBackWidget ?? true)
          ? InkWell(
              onTap: () => AppNavigator.pop(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Palette.white,
              ))
          : Container(),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: AppFont.t.s(19).w600.white,
          ),
          if (widget.subTitle != null)
            Text(
              widget.subTitle!,
              style: AppFont.t.s(13).black,
            ),
        ],
      ),
    );
  }
}
