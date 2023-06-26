import 'package:flutter/material.dart';

import '../../../../configs/Palette.dart';
import '../../../../configs/app_fonts.dart';

class AvatarWidget extends StatelessWidget {
  final String chekType;
  final BuildContext context;
  const AvatarWidget({super.key, required this.chekType, required this.context});

  @override
  Widget build(BuildContext context) {
    return _avatarContaint(chekType, context);
  }

  Widget _avatarContaint(String type, BuildContext context) {
    switch (type) {
      case "PUBLIC":
        return avatar1(context: context);
      case "PROTECTED":
        return avatar1(context: context);
      case "PRIVATE":
        return avatar2(context: context);
      case "DEFAULT":
        return avatar2(context: context);

      default:
        return avatar1(context: context);
    }
  }

  Widget avatar1({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => _showdiaglogAvtar(context: context),
              child: const CircleAvatar(
                radius: 62,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
            ),
            // if (chat.isActive)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: Palette.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget avatar2({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Center(
        child: Stack(
          children: [
            const CircleAvatar(
              radius: 62,
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
            // if (chat.isActive)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: Palette.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showdiaglogAvtar({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Đổi ảnh nhóm',
                  style: AppFont.t.s(18).w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Gỡ',
                  style: AppFont.t.s(18).w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Chụp ảnh',
                  style: AppFont.t.s(18).w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Chọn ảnh',
                  style: AppFont.t.s(18).w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
