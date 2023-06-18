import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chanel, required this.press, required this.isStatus}) : super(key: key);

  final Chanel chanel;
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
              child: Text(calculateTimeDifference(DateTime.fromMillisecondsSinceEpoch(chanel.lastMessage?.createdDate ?? 0).toLocal(), DateTime.now().toLocal())),
            ),
          ],
        ),
      ),
    );
  }

  String calculateTimeDifference(DateTime startTime, DateTime endTime) {
    final difference = endTime.difference(startTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      final minutes = difference.inMinutes.remainder(60);
      return '$hours giờ $minutes phút';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ngày';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      final days = difference.inDays.remainder(7);
      return '$weeks tuần $days ngày';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      final weeks = (difference.inDays.remainder(30) / 7).floor();
      return '$months tháng $weeks tuần';
    } else {
      final years = (difference.inDays / 365).floor();
      final months = (difference.inDays.remainder(365) / 30).floor();
      return '$years năm $months tháng';
    }
  }
}
