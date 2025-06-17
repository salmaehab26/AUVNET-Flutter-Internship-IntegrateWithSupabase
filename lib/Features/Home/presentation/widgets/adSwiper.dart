import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Adswiper extends StatefulWidget {
  const Adswiper({Key? key}) : super(key: key);

  @override
  State<Adswiper> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<Adswiper> {
   PageController controller = PageController();
   int count = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 180.h,
          width: 343.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: PageView.builder(
              controller: controller,
              itemCount: count,
              itemBuilder: (context, index) {
                return Image.asset(
                  "assets/images/AdSwiper.png",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SmoothPageIndicator(
          controller: controller,
          count: count,
          effect: WormEffect(
            dotHeight: 8.h,
            dotWidth: 8.w,
            activeDotColor: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
