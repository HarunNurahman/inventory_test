import 'package:intl/intl.dart';

class AppFormat {
  String formatCurrency(num number) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(number);
  }
}
