

import 'package:base_app/src/app.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';
import 'package:base_app/src/share_components/bloc_observer.dart';
import 'package:base_app/src/utils/extension/hive_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Injection.inject();
  await Hive.initFlutter();
  Hive.registerAdapter(LocationHeviAdapter());

  runApp(MultiBlocProvider(providers: Injection.cubitProvider, child: const MyApp()));
}
