import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/features/messages/components/setting_message.dart';
import 'package:flutter/material.dart';

import '../../../data/model/message_model.dart';
import '../../../utils/enum/enum_status.dart';
import 'audio_message.dart';
import 'file_message.dart';
import 'image_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class Message extends StatefulWidget {
  const Message({Key? key, required this.message, required this.listViewer}) : super(key: key);

  final ContentMessage message;
  final List<Viewer> listViewer;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ContentMessage message) {
      switch (message.type ?? TypeMessage.sttMESSAGE) {
        case "MESSAGE":
          return TextMessage(message: message);
        case "SETTING":
          return SettingMessage(message: message);
        default:
          return const SizedBox();
      }
    }

    Widget fileContaint(ContentMessage message) {
      switch (message.type ?? ChatMessageType.file) {
        case "FILE":
          return FilesMessage(message: message);
        case "IMAGE":
          return ImageMessage(message: message);
        case "AUDIO":
          return AudioMessage(message: message);
        case "VIDEO":
          return const VideoMessage();
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: widget.message.id == appData.userModel?.account?.id ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!(widget.message.id == appData.userModel?.account?.id)) ...[
            widget.message.type != "SETTING"
                ? const CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage("assets/images/user_2.png"),
                  )
                : Container(),
            BoxMain.w(8)
          ],
          messageContaint(widget.message),
          if (widget.message.files != []) fileContaint(widget.message),
          if (widget.message.id == appData.userModel?.account?.id) MessageStatusDot(status: widget.listViewer != [] ? MessageStatus.viewed : MessageStatus.notView)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.notSent:
          return Palette.red;
        case MessageStatus.notView:
          return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return Palette.success;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 16 / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.notSent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
