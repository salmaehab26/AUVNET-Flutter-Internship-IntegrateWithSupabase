import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Core/routes_manager/app_routes.dart';
import 'Home/presentation/Screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkAuthStatus() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
      });
    }
  }

  void initState() {
    super.initState();
    checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/nawel.png',
          width: 336.w,
          height: 336.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
