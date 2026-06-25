import 'package:flutter/material.dart';

/// Date/time utility extensions for GramCare.
extension DateTimeX on DateTime {
  /// Format as 'DD MMM YYYY' (e.g., '15 Jan 2025')
  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '$day ${months[month - 1]} $year';
  }

  /// Format as 'HH:MM AM/PM'
  String get formattedTime {
    final h = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    final m = minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }

  /// Format as 'DD MMM YYYY, HH:MM AM/PM'
  String get formattedDateTime => '$formattedDate, $formattedTime';

  /// Format as relative time ('Just now', '5 min ago', 'Yesterday', etc.)
  String get relative {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hr ago';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} weeks ago';
    return formattedDate;
  }

  /// Start of day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// End of day (23:59:59)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  /// Start of week (Monday)
  DateTime get startOfWeek {
    final diff = weekday - DateTime.monday;
    return subtract(Duration(days: diff)).startOfDay;
  }

  /// Start of month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// End of month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59);

  /// Check if same day
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  /// Age calculation from birth date
  int get age {
    final now = DateTime.now();
    var years = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      years--;
    }
    return years;
  }

  /// Time of day extraction
  TimeOfDay get timeOfDay => TimeOfDay(hour: hour, minute: minute);
}

extension TimeOfDayX on TimeOfDay {
  /// Format as 'HH:MM AM/PM'
  String get formatted {
    final h = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final m = minute.toString().padLeft(2, '0');
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return '$h:$m $period';
  }

  /// Convert to DateTime on today
  DateTime toDateTimeToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  /// Compare two TimeOfDay values
  bool isBefore(TimeOfDay other) {
    if (hour < other.hour) return true;
    if (hour == other.hour && minute < other.minute) return true;
    return false;
  }

  bool isAfter(TimeOfDay other) {
    if (hour > other.hour) return true;
    if (hour == other.hour && minute > other.minute) return true;
    return false;
  }
}
