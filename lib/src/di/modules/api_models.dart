

import '../../constans/api_path.dart';
import '../../data/remote/authentication_api.dart';
import '../../network/base_dio.dart';
import '../injection.dart/injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provider() async {
    final dio = await BaseDio.setup();
    getIt.registerLazySingleton(() => dio);
    getIt.registerLazySingleton(() => AuthenticationApi(dio, baseUrl: ApiPath.baseUrlApi));

  }
}
