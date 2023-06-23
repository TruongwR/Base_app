import 'package:flutter/material.dart';

import '../../../../configs/app_fonts.dart';
import '../../../../configs/box.dart';
import '../../../../configs/palette.dart';
part './widget_icon_public.dart';
part './widget_icon_protected.dart';
part './widget_icon_private.dart';
part './widget_icon_default.dart';

class ListIcons extends StatelessWidget {
  final String checkType;
  const ListIcons({super.key, required this.checkType});

  @override
  Widget build(BuildContext context) {
    return listIconsContaint(checkType);
  }

  Widget listIconsContaint(String type) {
    switch (type) {
      case "PUBLIC":
        return _listIconsPublic();
      case "PROTECTED":
        return _listIconsProtected();
      case "PRIVATE":
        return _listIconsPrivate();
      case "DEFAULT":
        return _listIconsDefault();

      default:
        return _listIconsPublic();
    }
  }
}

Widget buildIcon({required IconData icon, required Function() onTap, required String subTitle}) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Palette.grayC4,
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: Palette.white,
          ),
        ),
      ),
      BoxMain.h(4),
      Text(
        subTitle,
        style: AppFont.t.w600,
      ),
    ],
  );
}
