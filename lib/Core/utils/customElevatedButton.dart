import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_colors.dart';

class CustomElevatedbutton extends StatelessWidget {
  CustomElevatedbutton({super.key, required this.text,
    required this.onPressed,
   });

  String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 343.w,
      child: ElevatedButton(
        onPressed: onPressed,


        style: ElevatedButton.styleFrom(

          backgroundColor: ColorManager.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: ColorManager.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    )
    ;
  }
}
