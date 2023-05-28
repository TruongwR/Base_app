import 'package:base_app/src/data/model/use_model.dart';

class AppData {
  String accessToken = '';
  String refestToken = '';
  UserModel? userModel;

  void clear() {
    userModel = UserModel();
    accessToken = '';
    refestToken = '';
  }
}
