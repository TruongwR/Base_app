import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/message_model.dart';

class SettingMessage extends StatelessWidget {
  const SettingMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ContentMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 40).w,
      padding: const EdgeInsets.all(4),
      child: Center(
        child: SizedBox(
          width: ((MediaQuery.of(context).size.width - 40) * 2 / 3).w,
          child: Text(
            message!.content ?? "",
            style: AppFont.t.s(12),
          ),
        ),
      ),
    );
  }
}
