import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  CustomBottomSheet._();

  static Future<void> showCustomModelBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? color,
    VoidCallback? onClosed,
  }) async {
    try {
      await showModalBottomSheet<dynamic>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: child,
            ),
          );
        },
      );
    } finally {
      onClosed?.call();
    }
  }
}