import 'package:auvnet_flutter_task/Core/routes_manager/app_routes.dart';
import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_boarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onBoarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "title": "all-in-one delivery",
      "desc":
          "Order groceries, medicines, and meals delivered straight to your door",
    },
    {
      "title": "User-to-User Delivery",
      "desc": "Send or receive items from other users quickly and easily",
    },
    {
      "title": "Sales & Discounts",
      "desc": "Discover exclusive sales and deals every day",
    },
  ];

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_shown', true);
    Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorManager.whiteColor,
      body: Stack(
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
                  alignment: Alignment.topCenter,
                  height: 336.h,

                  child: Image.asset(
                    "assets/images/nawel.png",
                    height: 336.h,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged:
                      (index) => setState(() => currentIndex = index),
                  itemBuilder: (_, index) {
                    bool isLast = index == pages.length - 1;
                    return OnboardingPage(
                      title: pages[index]['title']!,
                      description: pages[index]['desc']!,
                      isLastPage: isLast,
                      onGetStarted: finishOnboarding,
                    );
                  },
                ),
              ),


          // Positioned(
          //   bottom: 16,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: SmoothPageIndicator(
          //       controller: _controller,
          //       count: pages.length,
          //       effect: WormEffect(
          //         activeDotColor: ColorManager.primaryColor,
          //         dotHeight: 10,
          //         dotWidth: 10,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
