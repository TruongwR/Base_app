import 'dart:io';

import 'package:base_app/src/configs/box.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:base_app/src/utils/helpers/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
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
                      onPressed: () async {
                        Directory? directory = await getExternalStorageDirectory();
                        String imagePath = '${directory?.path}/Pictures/';
                        Directory imageDir = Directory(imagePath);
                        List<FileSystemEntity> images = imageDir.listSync(recursive: true, followLinks: false);

                        for (var image in images) {
                          if (image is File) {
                            String imagePath = image.path;
                          }
                        }
                      },
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
}
