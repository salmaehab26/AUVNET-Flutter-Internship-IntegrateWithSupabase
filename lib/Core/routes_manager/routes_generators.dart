
import 'package:auvnet_flutter_task/Features/Home/presentation/Screens/HomeScreen.dart';
import 'package:auvnet_flutter_task/Features/signup/presentation/screen/signupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Features/login/presentation/screens/loginScreen.dart';
import '../../Features/onboarding/on_boarding_screen.dart';
import '../../Features/splashScreen.dart';
import 'app_routes.dart';

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.signupRoute:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
