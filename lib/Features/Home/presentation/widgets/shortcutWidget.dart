import 'package:auvnet_flutter_task/Core/utils/app_styles.dart';
import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShortcutWidget extends StatelessWidget {
  ShortcutWidget({super.key, required this.image, required this.title});

  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 65.w,
              height: 65.h,
              decoration: BoxDecoration(
                color: ColorManager.lightyellowcolor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(image: AssetImage(image)),
            ),
          ],
        ),
        Text(
          title,
          style: AppStyles.blackmedium12Text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
