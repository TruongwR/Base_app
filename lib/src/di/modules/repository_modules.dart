import 'package:base_app/src/data/repositories/implement/authentication_implement.dart';
import 'package:base_app/src/data/repositories/repository/authentication_repository.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';

class RepositoryMoudules extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerSingleton<AuthenticationRepository>(
      AuthenRepoImpl(),
    );
  }
}
