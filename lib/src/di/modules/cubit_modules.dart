import 'package:Whispers/src/cubit/active_account_cubit.dart';
import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/fotget_password_cubit.dart';
import 'package:Whispers/src/cubit/login_cubit_cubit.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/data/repositories/repository/chanrl_repository.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import '../../cubit/detail_chanel_cubit.dart';
import '../../cubit/signup_cubit.dart';

class CubitModule extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerFactory(() => LoginCubitCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => FotgetPasswordCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => SignupCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => ActiveAccountCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => EditProfileCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => ChanelListAllCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => DetailChanelCubit(chanelRepository: getIt<ChanelRepository>()));
  }
}
