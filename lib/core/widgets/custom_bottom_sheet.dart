import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  CustomBottomSheet._();

  static void showCustomModelBottomSheet(
          {required BuildContext context,
          required Widget child,
          Color? color,
          VoidCallback? onClosed}) =>
      showModalBottomSheet<dynamic>(
        
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: color,
        barrierColor: Colors.transparent,
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: child,
            ),
          );
        },
      ).whenComplete(onClosed ?? () {});
}
