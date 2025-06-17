import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  final List<String> _texts = [
    "all-in-one delivery",
    "User-to-User Delivery",
    "Sales & Discounts",
  ];

  void _next() {
    if (_currentIndex < _texts.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // Navigate to home or login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/onboarding.png"),
                    height: 336.h,
                    alignment: Alignment.topLeft,
                  ),
                  Positioned(
                    top: 91.h,
                    left: 20.w,
                    child: Container(
                      height: 336.h,
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/nawel.png",
                        height: 336.h,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // النص المتغير فقط
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 0),
              child: Container(
                width: 300.w,
                height: 108.h,
                child: Text(
                  _texts[_currentIndex],
                  key: ValueKey(_texts[_currentIndex]),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
            const SizedBox(height: 40),

            Container(
              width: 295.w,
              height: 91.h,
              color: Colors.deepOrange,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,

                ),
                onPressed: _next,
                child: Text(
                  _currentIndex == _texts.length - 1 ? "Start" : "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
