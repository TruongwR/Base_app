import 'package:base_app/src/configs/theme.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: EasyLoading.init(),
            theme: AppTheme.themData,
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppNavigator.getRoute,
            title: 'Chatting',
            debugShowCheckedModeBanner: false,
            navigatorObservers: [routeObserver],
            initialRoute: Routes.wellcomeScreen,
          );
        },
      ),
    );
  }
}
