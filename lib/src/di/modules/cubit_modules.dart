import 'package:base_app/src/cubit/cubit/login_cubit_cubit.dart';
import 'package:base_app/src/data/repositories/repository/authentication_repository.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';

class CubitModule extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerFactory(
      () => LoginCubitCubit(authen: getIt<AuthenticationRepository>()),
    );
  }
}
