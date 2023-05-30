import 'package:base_app/src/cubit/login_cubit_cubit.dart';
import 'package:base_app/src/di/modules/repository_modules.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
     BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
  ];
}

AppData get appData => getIt<AppData>();
