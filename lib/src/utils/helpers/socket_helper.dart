import 'package:Whispers/src/utils/until.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../../data/model/socket_view_model.dart';
import '../../di/injection.dart/injection.dart';

class SocketHelper {
  // Declare stompClient as a class member

  void initializeStompClient() {
    appData.stompClient = StompClient(
      config: StompConfig(
        url: 'wss://cuongnh2k.space:9998/ws?User-Agent=${appData.userAgent}&Authorization=Bearer%20${appData.accessToken}', // URL of the WebSocket server
        onConnect: onConnectCallback, // Callback function called on successful connection
        onWebSocketError: onErrorCallback, // Callback function called on WebSocket error
      ),
    );

    appData.stompClient?.activate();
  }

  void onConnectCallback(StompFrame connectFrame) {
    Logger.d("Connect", '/user/${appData.userModel?.account?.id}/private');
    appData.stompClient?.subscribe(
      destination: '/user/${appData.userModel?.account?.id}/private',
      callback: (value) {
        appData.streamController.updateSocketData(socketViewModelFromJson(value.body ?? ""));
        Logger.d("value", value);
        Logger.d("value", value.body);
      },
    );
    // Send a message
    // stompClient.send(
    //   destination: '/user/+${appData.userModel?.account?.id}+/private',
    //   body: 'Hello, Server!',
    // );
  }

  void onErrorCallback(dynamic error) {
    Logger.d('WebSocket error: $error');
  }
}
