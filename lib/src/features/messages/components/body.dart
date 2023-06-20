import 'package:flutter/material.dart';
import '../../../data/model/message_model.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  final List<ContentMessage> listDetail;
  final List<Viewer> listViewer;
  const Body({required this.listDetail, required this.listViewer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: listDetail.length,
              itemBuilder: (context, index) => Message(message: listDetail[index], listViewer: listViewer),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
