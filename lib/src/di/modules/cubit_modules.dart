import 'package:base_app/src/cubit/login_cubit_cubit.dart';
import 'package:base_app/src/data/repositories/repository/authentication_repository.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';

import '../../cubit/signup_cubit.dart';

class CubitModule extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerFactory(
      () => LoginCubitCubit(authen: getIt<AuthenticationRepository>()),
    );
    getIt.registerFactory(
      () => SignupCubit(authen: getIt<AuthenticationRepository>()),
    );
  }
}
