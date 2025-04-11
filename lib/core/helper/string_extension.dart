import 'package:intl/intl.dart';

extension StringExtension on String {
  String convertDataFormat() {
    final now = DateTime.now();
    return DateFormat("d MMM , y, -h:mm a").format(now);
     }
}