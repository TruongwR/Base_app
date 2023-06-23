import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/features/active_account/active_account_screen.dart';
import 'package:Whispers/src/features/edit_profile/edit_profile_screen.dart';
import 'package:Whispers/src/features/fotget_password/fotget_password.dart';
import 'package:Whispers/src/features/messages/channel_detail/channel_detail_screen.dart';
import 'package:Whispers/src/features/sign_in/sign_in_screen.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';
import '../features/messages/message_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/sign_up/sign_up_screen.dart';

import '../features/welcome/welcome_screen.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.wellcomeScreen:
        return _buildRoute(
          settings,
          const WelcomeScreen(),
        );

      case Routes.signInScreen:
        return _buildRoute(
          settings,
          const SignInScreen(),
        );
      case Routes.fotgetPassword:
        return _buildRoute(
          settings,
          const FotgetPasswordScreen(),
        );
      case Routes.signUpScreen:
        return _buildRoute(
          settings,
          const SignUpScreen(),
        );
      case Routes.activeAccountScreen:
        return _buildRoute(
          settings,
          const ActiveAccountScreen(),
        );
      case Routes.homeScreen:
        return _buildRoute(
          settings,
          const HomeScreen(),
        );
      case Routes.profileScreen:
        return _buildRoute(
          settings,
          const ProfileScreen(),
        );
      case Routes.editProfileScreen:
        return _buildRoute(
          settings,
          const EditProfileScreen(),
        );
      case Routes.messagesScreen:
        final chanel = settings.arguments as Chanel;
        return _buildRoute(
          settings,
          MessagesScreen(chanel: chanel),
        );
      case Routes.channelDetailScreen:
        final chanel = settings.arguments as Chanel;
        return _buildRoute(
          settings,
          ChannelDetailScreen(
            chanel: chanel,
          ),
        );
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
