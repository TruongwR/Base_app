
import 'package:Whispers/src/data/model/use_model.dart';

class AppData {
  String accessToken = '';
  String refestToken = '';
  UserModel? userModel;
  String? avatar;

  void clear() {
    userModel = UserModel();
    accessToken = '';
    refestToken = '';
  }
}
