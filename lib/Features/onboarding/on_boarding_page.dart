import 'package:auvnet_flutter_task/Core/utils/customElevatedButton.dart';
import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final bool isLastPage;
  final VoidCallback onGetStarted;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.isLastPage,
    required this.onGetStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff333333),
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 100,),
          CustomElevatedbutton(
            onPressed: isLastPage ? onGetStarted : null,
             text:  "Get Started",
              ),

          const SizedBox(height: 12),
          if (!isLastPage)
            const Text(
              "next",
              style: TextStyle(color: ColorManager.primaryColor),
            ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
