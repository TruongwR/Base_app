import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../data/data_sources/local/app_data.dart';
import '../modules/api_models.dart';

GetIt getIt = GetIt.I;

abstract class DIModule {
  void provider();
}

class Injection{
   static Future<void> inject() async {
    await ApiModule().provider();
  }
   static final List<BlocProvider> cubitProvider = [
    // BlocProvider<GetOtpSignupCubit>(create: (context) => getOtpSignupCubit),

  ];
}
AppData get appData => getIt<AppData>();