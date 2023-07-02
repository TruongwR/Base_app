import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:flutter/material.dart';

import '../../../configs/Palette.dart';
import '../../../configs/app_fonts.dart';
import '../../../share_components/time/time_extension.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {Key? key, required this.chanel, required this.press, required this.isStatus, required this.type, this.longPress})
      : super(key: key);
  final int type;
  final Channel chanel;
  final VoidCallback press;
  final Function()? longPress;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      onLongPress: longPress,
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
                  children: type == 1
                      ? <Widget>[
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
                        ]
                      : (type == 2
                          ? <Widget>[
                              Text(
                                chanel.name ?? '',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                              Opacity(
                                opacity: 0.64,
                                child: Text(
                                  'Whisper',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppFont.t.s(16).w600,
                                ),
                              ),
                            ]
                          : [
                              Text(
                                chanel.name ?? '',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ]),
                ),
              ),
            ),
            type == 1
                ? Opacity(
                    opacity: 0.64,
                    child: Text(calculateTimeDifference(
                        DateTime.fromMillisecondsSinceEpoch(chanel.lastMessage?.updatedTime ?? 0).toLocal(),
                        DateTime.now().toLocal())),
                  )
                : (type == 2
                    ? const SizedBox()
                    : const Icon(
                        Icons.circle_outlined,
                        color: Palette.gray97,
                      )),
          ],
        ),
      ),
    );
  }
}
