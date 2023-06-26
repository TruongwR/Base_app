import 'package:Whispers/src/configs/Palette.dart';
import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/box.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/list_chanel_parrent_model.dart';
part './widget_default.dart';
part './widget_private.dart';
part './widget_protected.dart';
part './widget_public.dart';

class Body extends StatelessWidget {
  final String checkTypeChanel;
  const Body({super.key, required this.checkTypeChanel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: bodyContaint(checkTypeChanel),
    );
  }

  Widget bodyContaint(String type) {
    switch (type) {
      case "PUBLIC":
        return _bodyPublic();
      case "PROTECTED":
        return _bodyProtected();
      case "PRIVATE":
        return _bodyPrivate();
      case "DEFAULT":
        return _bodyDefault();

      default:
        return _bodyPublic();
    }
  }
}

Widget columnLayout({required Function() onTap, required String title, IconData? icon, int type = 1, bool btnCheckOut = false}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: btnCheckOut ? AppFont.t.s(18).red : AppFont.t.s(18).w500,
          ),
          type == 1
              ? CircleAvatar(
                  radius: 16,
                  backgroundColor: Palette.grayC4,
                  child: Icon(
                    icon,
                    color: btnCheckOut ? Palette.red : Palette.primary,
                  ),
                )
              : Icon(
                  icon,
                  color: Palette.primary,
                ),
        ],
      ),
    ),
  );
}
