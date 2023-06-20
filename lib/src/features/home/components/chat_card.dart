import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:flutter/material.dart';

import '../../../share_components/time/time_extension.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({Key? key, required this.chanel, required this.press, required this.isStatus}) : super(key: key);

  final Chanel chanel;
  final VoidCallback press;
  final bool isStatus;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  List<Chanel> listChanel = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...listChanel.map((e) => lisData(chanel: e))],
    );
  }

  Widget lisData({required Chanel chanel}) {
    return InkWell(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chanel.avatarFileId ?? "assets/images/user.png"),
                ),
                // if (chat.isActive)
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
                      chanel.name ?? '',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chanel.lastMessage?.content ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: chanel.lastMessage?.isWatched == "NO" ? AppFont.t.s(16).w600 : AppFont.t,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(calculateTimeDifference(DateTime.fromMillisecondsSinceEpoch(chanel.lastMessage?.updatedTime ?? 0).toLocal(), DateTime.now().toLocal())),
            ),
          ],
        ),
      ),
    );
  }


}
