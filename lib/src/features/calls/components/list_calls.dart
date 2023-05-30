import 'package:base_app/src/configs/box.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:flutter/material.dart';

import '../../../data/model/Chat.dart';

class ListCalls extends StatelessWidget {
  const ListCalls({Key? key, required this.chat, required this.press, required this.isStatus}) : super(key: key);

  final Chat chat;
  final VoidCallback press;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
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
                      chat.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                        opacity: 0.64,
                        child: Row(
                          children: [
                            Icon(
                              chat.typeCall == '0' ? Icons.video_camera_front : Icons.call,
                              size: 14,
                              color: chat.statusCall == '2' ? Palette.red : Palette.gray66,
                            ),
                            Text(
                              chat.actionCall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: chat.statusCall == '2' ? Palette.red : Palette.gray66),
                            ),
                            BoxMain.w(8),
                            Opacity(
                              opacity: 0.64,
                              child: Text(
                                chat.timeCall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Icon(chat.typeCall == '0' ? Icons.videocam : Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
