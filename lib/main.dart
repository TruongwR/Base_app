import 'package:Whispers/src/app.dart';
import 'package:Whispers/src/di/injection.dart/injection.dart';
import 'package:Whispers/src/share_components/bloc_observer.dart';
import 'package:Whispers/src/utils/extension/hive_location.dart';
import 'package:Whispers/src/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Injection.inject();
  await Hive.initFlutter();
  Hive.registerAdapter(LocationHeviAdapter());
  appData.userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
  Logger.d("userAgent", appData.userAgent);
  runApp(MultiBlocProvider(providers: Injection.cubitProvider, child: const MyApp()));
}
