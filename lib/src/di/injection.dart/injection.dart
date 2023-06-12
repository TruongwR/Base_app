import 'package:Whispers/src/cubit/active_account_cubit.dart';
import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/fotget_password_cubit.dart';
import 'package:Whispers/src/cubit/login_cubit_cubit.dart';
import 'package:Whispers/src/di/modules/repository_modules.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../cubit/chanel_list_all_cubit.dart';
import '../../cubit/signup_cubit.dart';
import '../../data/data_sources/local/app_data.dart';
import '../modules/api_modules.dart';
import '../modules/componetn_modules.dart';
import '../modules/cubit_modules.dart';

GetIt getIt = GetIt.I;

abstract class DIModule {
  void provider();
}

class Injection {
  static Future<void> inject() async {
    await ApiModule().provider();
    await ComponentModules().provider();
    await RepositoryMoudules().provider();
    await CubitModule().provider();
  }

  static final List<BlocProvider> cubitProvider = [
    BlocProvider<LoginCubitCubit>(create: (context) => getIt<LoginCubitCubit>()),
    BlocProvider<FotgetPasswordCubit>(create: (context) => getIt<FotgetPasswordCubit>()),
    BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
    BlocProvider<ActiveAccountCubit>(create: (context) => getIt<ActiveAccountCubit>()),
    BlocProvider<EditProfileCubit>(create: (context) => getIt<EditProfileCubit>()),
    BlocProvider<ChanelListAllCubit>(create: (context) => getIt<ChanelListAllCubit>(),)
  ];
}

AppData get appData => getIt<AppData>();
