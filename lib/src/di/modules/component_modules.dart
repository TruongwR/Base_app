import 'package:Whispers/src/data/data_sources/local/app_data.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/utils/helpers/socket_helper.dart';

class ComponentModules extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerLazySingleton<AppData>(() => AppData());
    getIt.registerLazySingleton<SocketHelper>(() => SocketHelper());
  }
}
