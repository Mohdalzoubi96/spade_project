import 'package:flutter/material.dart';
import 'package:spade_project/features/authentication/auth.export.dart';
import 'package:spade_project/utils/services/routes.dart';

import '../../features/feature.export.dart';

/// Global Context of App
BuildContext? get currentContext =>
    CustomNavigator.navigatorState.currentContext;

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
    }
  }

  /// Handle page if there is no route should be pop to HomePage, if there is a route should be pop to it.
  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    } else {
      CustomNavigator.push(Routes.HOME_SCREEN, clean: true);
    }
  }

  // track navigation of user
  static dynamic push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (_) => false,
        arguments: arguments,
      );
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  static dynamic pushNamedAndRemoveUntil(
    String routeName,
  ) {
    return navigatorState.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => route.isFirst);
  }
}
