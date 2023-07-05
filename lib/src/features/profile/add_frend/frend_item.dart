import 'package:Whispers/src/data/model/fotget_password_model.dart';
import 'package:flutter/material.dart';

import '../../../configs/Palette.dart';

class ItemFrend extends StatelessWidget {
  const ItemFrend({
    Key? key,
    this.chanel,
  }) : super(key: key);

  final Person? chanel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
      child: Row(children: <Widget>[
        Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(chanel?.avatarFileId ?? "assets/images/user.png"),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Palette.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${chanel?.firstName} ${chanel?.lastName}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
