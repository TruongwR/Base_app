import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../cubit/cubit/login_cubit_cubit.dart';
import '../../di/injection.dart/injection.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final loginCubit = getIt<LoginCubitCubit>();
  @override
  void initState() {
    getHive();
    super.initState();
  }

  void getHive() async {
    var userInfor = await Hive.openBox('tbl_user');
    String? email = userInfor.get('email');
    String? passWord = userInfor.get('passWord');
    if (userInfor.isNotEmpty && email != null && passWord != null) {
      loginCubit.login(email: email, passWord: passWord);
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () => AppNavigator.pushAndRemoveUntil(Routes.signInScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset("assets/images/welcome_image.png"),
            const Spacer(flex: 3),
            Text(
              "Welcome to our Whispers \nmessaging app",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Chatty talk any person of your \nmother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
