import 'package:auvnet_flutter_task/Core/utils/app_styles.dart';
import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantsWidget extends StatelessWidget {
   RestaurantsWidget({super.key,  required this.image,
    required this.title,
    required this.text,});
  String image;
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:Color(0xffD9D9D9)),
            ),
            child: Image(image: AssetImage(image)),
          ),
          Text(title,style: AppStyles.blackmedium12Text,),
          Row(children: [Icon(CupertinoIcons.clock,size: 10,),Text(text,style: AppStyles.graymedium10text,)],)

        ],
      ),
    );
  }
}
