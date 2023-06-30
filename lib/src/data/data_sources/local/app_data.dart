import 'package:Whispers/src/data/model/use_model.dart';
import 'package:web_socket_channel/io.dart';

class AppData {
  String accessToken = '';
  String refestToken = '';
  UserModel? userModel;
  String? avatar;
  String userAgent = '';
  IOWebSocketChannel? channel;

  void clear() {
    userModel = UserModel();
    accessToken = '';
    refestToken = '';
  }
}
