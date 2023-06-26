// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:Whispers/src/configs/box.dart';
import 'package:Whispers/src/configs/palette.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:microphone/microphone.dart';
import 'package:path_provider/path_provider.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16 / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: Palette.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Palette.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        MicrophoneRecorder recorder = MicrophoneRecorder();
                        await recorder.start();
                        await Future.delayed(const Duration(seconds: 5));
                        await recorder.stop();
                        Uint8List data = await recorder.toBytes();
                        Logger.d("Data mic", utf8.decode(data));
                      },
                      icon: Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                      ),
                    ),
                    BoxMain.w(4),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            String? filePath = result.files.single.path;
                            if (filePath != null) {
                              // Tải tệp lên API
                              Logger.d("Update file");
                            }
                          }
                        },
                        icon: Icon(
                          Icons.attach_file,
                          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                        )),
                    IconButton(
                      onPressed: () => openImagePicker(context),
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Đã chọn một ảnh từ máy ảnh thành công
      File image = File(pickedFile.path);

      // Xử lý ảnh ở đây (ví dụ: tải lên server, lưu vào thư mục khác, ...)
      // ...

      // Hiển thị ảnh đã chọn
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selected Image'),
            content: Image.file(image),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Người dùng không chọn ảnh
    }
  }
}
