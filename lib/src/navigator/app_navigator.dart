

// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashScreen:
      //   return _buildRoute(
      //     settings,
      //     const SplashScreen(),
      //   );

      // case Routes.changePasswordScreen:
      //   final isForgot = settings.arguments as bool?;
      //   return _buildRoute(
      //     settings,
      //     ChangePasswordScreen(isForgotPass: isForgot),
      //   );


      default:
        return null;
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
  ) {
    return MaterialPageRoute(
      builder: (context) => builder,
      settings: routeSettings,
    );
  }

  static Future push<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamed(route, arguments: arguments);
  }

  static Future pushAndRemoveUntil<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future replaceWith<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) {
    state.popUntil(ModalRoute.withName(route));
  }

  static void pop([Object? arg]) {
    if (canPop) {
      state.pop(arg);
    }
  }

  static void popPush(
    String route, {
    Object? arguments,
  }) {
    if (canPop) {
      state.popAndPushNamed(route, arguments: arguments);
    }
  }

  static bool get canPop => state.canPop();

  static BuildContext? get context => navigatorKey.currentContext;

  static NavigatorState get state => navigatorKey.currentState!;
}
