import 'package:Whispers/src/configs/palette.dart';
import 'package:flutter/material.dart';

import '../../../data/model/message_model.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ContentMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16 * 0.75,
        vertical: 16 / 2,
      ),
      decoration: BoxDecoration(
        color: Palette.primary.withOpacity(message!.isSender ?? true ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Text(
          message!.content ?? "",
          style: TextStyle(
            color: message!.isSender ?? true ? Colors.white : Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
      ),
    );
  }
}
