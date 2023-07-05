import 'package:Whispers/src/cubit/active_account_cubit.dart';
import 'package:Whispers/src/cubit/chanel_list_all_cubit.dart';
import 'package:Whispers/src/cubit/check_messages_cubit.dart';
import 'package:Whispers/src/cubit/create_chanel_cubit.dart';

import 'package:Whispers/src/cubit/edit_profile_cubit.dart';
import 'package:Whispers/src/cubit/fotget_password_cubit.dart';
import 'package:Whispers/src/cubit/get_list_member_chanel_cubit.dart';
import 'package:Whispers/src/cubit/get_new_password_cubit.dart';

import 'package:Whispers/src/cubit/login_cubit_cubit.dart';
import 'package:Whispers/src/cubit/update_chanel_cubit.dart';
import 'package:Whispers/src/cubit/update_member_channel_cubit.dart';

import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/data/repositories/repository/chanel_repository.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import '../../cubit/detail_chanel_cubit.dart';
import '../../cubit/seen_message_cubit.dart';
import '../../cubit/signup_cubit.dart';

class CubitModule extends DIModule {
  @override
  Future<void> provider() async {
    getIt.registerFactory(() => LoginCubitCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => FotgetPasswordCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => GetNewPasswordCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => SignupCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => ActiveAccountCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => EditProfileCubit(authen: getIt<AuthenticationRepository>()));
    getIt.registerFactory(() => ChanelListAllCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => DetailChanelCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => CheckMessagesCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => CreateChanelCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => UpdateChanelCubit(chanelRepository: getIt<ChanelRepository>(), chanelListAllCubit: getIt<ChanelListAllCubit>()));
    getIt.registerFactory(() => UpdateMemberChannelCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => GetListMemberChanelCubit(chanelRepository: getIt<ChanelRepository>()));
    getIt.registerFactory(() => SeenMessageCubit(chanelRepository: getIt<ChanelRepository>()));
  }
}
