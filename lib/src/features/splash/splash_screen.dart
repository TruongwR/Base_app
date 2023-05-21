import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => AppNavigator.pushAndRemoveUntil(Routes.wellcomeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Palette.blue007EB8,
        child: Center(
          child: Text("Chatty", style: AppFont.t.s(100).w600.white),
        ),
      ),
    );
  }
}
