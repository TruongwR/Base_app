import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileAvatar extends StatelessWidget {
  final Function()? action;

  const ProfileAvatar({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(top: 30),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('${appData.avatar}'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: Center(
                heightFactor: 15,
                widthFactor: 15,
                child: IconButton(
                  onPressed: action,
                  icon: Icon(
                    LineAwesomeIcons.camera,
                    color: Palette.white,
                    size: ScreenUtil().setSp(16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
