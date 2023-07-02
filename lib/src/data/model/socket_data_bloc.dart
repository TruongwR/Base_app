import 'dart:async';

import 'package:Whispers/src/data/model/socket_view_model.dart';

class SocketDataBloc {
  StreamController<SocketViewModel> socketDataController =
      StreamController<SocketViewModel>();
  Stream<SocketViewModel> get socketDataStream =>
      socketDataController.stream;

  void updateSocketData(SocketViewModel data) {
    socketDataController.add(data);
  }

  void dispose() {
    socketDataController.close();
  }
}