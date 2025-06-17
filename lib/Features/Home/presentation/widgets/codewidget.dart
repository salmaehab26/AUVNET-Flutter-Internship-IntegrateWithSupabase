import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/app_styles.dart';
import '../../../../Core/utils/my_colors.dart';


class CodeWidget extends StatelessWidget {
  const CodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Center(
            child: Container(
              width: 343.w,
              height: 89.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0.w),
            child: Row(
              children: [
                Image(
                  image: AssetImage("assets/images/Gotacode.png"),
                  height: 79.h,
                  width: 80.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Got a code !",
                        style: AppStyles.blackbold14Text,
                      ),
                      Text("Add your code and save on your\norder",style: AppStyles.graymedium10text,),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }
}
