import 'package:intl/intl.dart';

class AgeCalculator {
  static Map<String, dynamic> calculate(DateTime birthDate) {
    DateTime now = DateTime.now();
    Duration diff = now.difference(birthDate);

    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;
    int days = now.day - birthDate.day;

    if (days < 0) {
      months -= 1;
      days += DateTime(now.year, now.month, 0).day;
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    return {
      'years': years,
      'months': months,
      'days': days,
      'totalDays': diff.inDays,
      'totalWeeks': (diff.inDays / 7).floor(),
      'totalHours': diff.inHours,
      'totalMinutes': diff.inMinutes,
      'nextBirthday': _daysUntilNextBirthday(birthDate),
      'zodiac': _getZodiacSign(birthDate),
      'dayOfWeek': DateFormat('EEEE').format(birthDate),
    };
  }

// next birthday
  static int _daysUntilNextBirthday(DateTime dob) {
    DateTime now = DateTime.now();
    DateTime next = DateTime(now.year, dob.month, dob.day);
    if (next.isBefore(now)) next = DateTime(now.year + 1, dob.month, dob.day);
    return next.difference(now).inDays;
  }

//ZodiacSign
  static String _getZodiacSign(DateTime date) {
    int days = date.day;
    int month = date.month;
    if (month == 1) return days >= 20 ? "Aquarius" : "Capricorn";
    if (month == 2) return days >= 19 ? "Pisces" : "Aquarius";
    if (month == 3) return days >= 21 ? "Aries" : "Pisces";
    if (month == 4) return days >= 20 ? "Taurus" : "Aries";
    if (month == 5) return days >= 21 ? "Gemini" : "Taurus";
    if (month == 6) return days >= 21 ? "Cancer" : "Gemini";
    if (month == 7) return days >= 23 ? "Leo" : "Cancer";
    if (month == 8) return days >= 23 ? "Virgo" : "Leo";
    if (month == 9) return days >= 23 ? "Libra" : "Virgo";
    if (month == 10) return days >= 23 ? "Scorpio" : "Libra";
    if (month == 11) return days >= 22 ? "Sagittarius" : "Scorpio";
    return days >= 22 ? "Capricorn" : "Sagittarius";
  }
}
