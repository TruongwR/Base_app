// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatefulWidget {
  const ImagePickerButton({super.key});

  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      final compressedImage = await compressImage(File(pickedImage.path));
      setState(() {
        _imageFile = compressedImage;
      });
    }
  }

  Future<File> compressImage(File file) async {
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      file.absolute.path,
      quality: 80,
    );

    final fileImage = File(compressedFile?.path ?? "");
    return fileImage;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            child: const Text('Chọn ảnh'),
          ),
          TextButton(
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
            child: const Text('Chụp ảnh'),
          ),
          if (_imageFile != null) ...[
            const SizedBox(height: 16),
            Image.file(
              _imageFile!,
              width: 200,
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Selected Image'),
                      content: Image.file(
                        _imageFile!,
                      ),
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
              },
              child: const Text('Đẩy ảnh lên'),
            ),
          ],
        ],
      ),
    );
  }
}
