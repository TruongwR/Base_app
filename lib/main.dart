import 'package:base_app/src/app.dart';
import 'package:base_app/src/di/injection.dart/injection.dart';
import 'package:base_app/src/share_components/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  await Injection.inject();

  // runApp(MultiBlocProvider(providers: Injection.cubitProvider, child: const MyApp()));
  runApp(const MyApp());
}
