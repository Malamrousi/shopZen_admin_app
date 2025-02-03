import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';

class ShowToast {
  const ShowToast._();

  static void showToastErrorTop({
    required String message,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: ColorsManger.alertColorRed600,
        textColor: ColorsManger.whiteColor,
        fontSize: 16.sp,
      );

  static void showToastSuccessTop({
    required String message,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: ColorsManger.alertColorGreen500,
        textColor: ColorsManger.whiteColor,
        fontSize: 16.sp,
      );
}