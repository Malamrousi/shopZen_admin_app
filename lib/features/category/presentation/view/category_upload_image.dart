import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: ColorsManger.gray200,
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://images.pexels.com/photos/15408808/pexels-photo-15408808/free-photo-of-photo-of-a-road-sign.jpeg'))),
    );
  }
}
