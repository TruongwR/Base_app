import 'dart:async';

import 'package:Whispers/src/data/model/use_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppData {
  String accessToken = '';
  String refestToken = '';
  UserModel? userModel;
  String? avatar;
  String userAgent = '';
  WebSocketChannel? channel;
  StreamController<String> streamController = StreamController<String>();

  void clear() {
    userModel = UserModel();
    accessToken = '';
    refestToken = '';
    streamController.close();
  }
}
