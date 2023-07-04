import 'package:Whispers/src/data/model/use_model.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../model/socket_data_bloc.dart';

class AppData {
  String accessToken = '';
  String refestToken = '';
  UserModel? userModel;
  String? avatar;
  String userAgent = '';
  WebSocketChannel? channel;
  StompClient? stompClient;
  SocketDataBloc streamController = SocketDataBloc();

  void clear() {
    userModel = UserModel();
    accessToken = '';
    refestToken = '';
    streamController.dispose();
  }
}
