import 'package:auvnet_flutter_task/Core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/my_colors.dart';


class ServicesWidget extends StatelessWidget {
  ServicesWidget({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  String image;
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            width: 105.w,
            height: 70.h,
            child: Image(image: AssetImage(image)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: ColorManager.whitegreyColor,
            ),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        Container(
          width: 60.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: Text(text, style: AppStyles.whiteregular12Text)),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
