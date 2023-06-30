import 'package:Whispers/src/utils/until.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../di/injection.dart/injection.dart';
import '../../network/api_path.dart';

class SocketHelper {
  io.Socket socket = io.io(
    '${ApiPath.connectSocker}?accessToken=${appData.accessToken}&userAgent=${appData.userAgent}',
    io.OptionBuilder().setTransports(['websocket']).build(),
  );

  void connectSocket() {
    Logger.d('SOCKET', 'Connecting');
    socket.onConnect((_) {
      Logger.d('SOCKET', 'Connected');
      Logger.d('SOCKET', 'Status: ${socket.connected}');
      socket.emit('user_connect', {'user/${appData.userModel?.account?.id}+/private'});
    });
  }
}
