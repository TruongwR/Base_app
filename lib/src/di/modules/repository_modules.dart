import 'package:Whispers/src/data/repositories/implement/authentication_implement.dart';
import 'package:Whispers/src/data/repositories/implement/chanel_implement.dart';
import 'package:Whispers/src/data/repositories/implement/device_verification_impl.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/data/repositories/repository/device_verification_repository.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';

import '../../data/repositories/repository/chanrl_repository.dart';

class RepositoryMoudules extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerSingleton<AuthenticationRepository>(
      AuthenRepoImpl(),
    );
    getIt.registerLazySingleton<DeviceVerificationRepository>(
      () => DeviceVerificationImpl(),
    );
    getIt.registerLazySingleton<ChanelRepository>(() => ChanelImplement());
  }
}
