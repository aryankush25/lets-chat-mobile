import 'package:intl/intl.dart';

/// DateTime related helper functions
class DateHelpers {
  static String formattedDate(String formattedString) {
    DateTime sentTime = DateTime.parse(formattedString);

    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

    if (sentTime.year == now.year &&
        sentTime.month == now.month &&
        sentTime.day == now.day) {
      return DateFormat.jm().format(sentTime);
    }

    if (sentTime.year == yesterday.year &&
        sentTime.month == yesterday.month &&
        sentTime.day == yesterday.day) {
      return 'Yesterday';
    }

    return DateFormat(
      'd/M/yy',
    ).format(
      sentTime,
    );
  }
}
