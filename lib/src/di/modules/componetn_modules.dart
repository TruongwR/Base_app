import 'package:base_app/src/data/data_sources/local/app_data.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';

class ComponentModules extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerLazySingleton<AppData>(() => AppData());
  }
}
