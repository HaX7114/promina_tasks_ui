import 'package:intl/intl.dart';

class TimeFormatter {
  static String getTimeFormatDayE(DateTime dateTime) {
    return DateFormat('E').format(dateTime);
  }

  static String getTimeFormatDayMonth(DateTime dateTime) {
    return DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(dateTime);
  }
}
