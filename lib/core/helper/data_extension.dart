import 'package:intl/intl.dart';

extension DataExtension on DateTime {
  String getFormatDateMontDayYear() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
