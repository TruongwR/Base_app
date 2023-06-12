import 'package:Whispers/src/cubit/active_account_cubit.dart';
import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/fotget_password_cubit.dart';
import 'package:Whispers/src/cubit/get_list_chanel_cubit.dart';
import 'package:Whispers/src/cubit/login_cubit_cubit.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import '../../cubit/signup_cubit.dart';

class CubitModule extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerFactory(
      () => LoginCubitCubit(authen: getIt<AuthenticationRepository>()),
    );
    getIt.registerFactory(
      () => FotgetPasswordCubit(authen: getIt<AuthenticationRepository>()),
    );
    getIt.registerFactory(
      () => SignupCubit(authen: getIt<AuthenticationRepository>()),
    );
    getIt.registerFactory(
      () => ActiveAccountCubit(authen: getIt<AuthenticationRepository>()),
    );
    getIt.registerFactory(
      () => GetListChanelCubit(authen: getIt<AuthenticationRepository>()),
    );
    getIt.registerFactory(
      () => EditProfileCubit(authen: getIt<AuthenticationRepository>()),
    );
  }
}
