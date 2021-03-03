/// DateTime related helper functions
class DateHelpers {
  /// Returns int for weekday (`monday = 1` ... `sunday = 7`)
  static int getWeekDay(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return 1;
      case 'tuesday':
        return 2;
      case 'wednesday':
        return 3;
      case 'thursday':
        return 4;
      case 'friday':
        return 5;
      case 'saturday':
        return 6;
      case 'sunday':
        return 7;
      default:
        return 1;
    }
  }

  /// Returns String (weekday name) for given integer
  static String getWeekDayName(int day) {
    switch (day) {
      case 1:
        return 'monday';
      case 2:
        return 'tuesday';
      case 3:
        return 'wednesday';
      case 4:
        return 'thursday';
      case 5:
        return 'friday';
      case 6:
        return 'saturday';
      case 7:
        return 'sunday';
      default:
        return 'monday';
    }
  }

  /// Returns month name from month number
  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'unknown';
    }
  }

  /// Convert 24 hours time to 12 hours format with AM/PM
  static String to12Hours(String time) {
    List<int> timeList = List<int>.from(time.split(':').map((t) => int.parse(t)));

    // find out am and pm
    String meridien;
    if (timeList[0] < 12)
      meridien = 'AM';
    else
      meridien = 'PM';

    // convert hours
    timeList[0] %= 12;

    // handle midnight/noon
    if (timeList[0] == 0) timeList[0] = 12;

    String convertedTime =
        '${timeList[0].toString().padLeft(2, '0')}:${timeList[1].toString().padLeft(2, '0')} $meridien';

    return convertedTime;
  }
}
