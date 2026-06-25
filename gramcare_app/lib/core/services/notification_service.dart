import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../database/app_database.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification tap
      },
    );
  }

  Future<void> scheduleMedicineReminder(Medicine medicine) async {
    // Basic logic to schedule based on frequency
    // In a real app, this would be more complex (parsing 'Daily', 'Twice a day', etc.)
    
    final id = medicine.id.hashCode;
    
    await _notificationsPlugin.zonedSchedule(
      id,
      'Time for your medicine!',
      'Please take ${medicine.dosage} of ${medicine.name}',
      _nextInstanceOfTime(medicine.timing),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'medicine_reminders',
          'Medicine Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOfTime(String timing) {
    // Simple mock logic for timing
    final now = tz.TZDateTime.now(tz.local);
    int hour = 9; // Default 9 AM
    if (timing.contains('After Meal')) hour = 14;
    if (timing.contains('Evening')) hour = 20;

    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> cancelAll() => _notificationsPlugin.cancelAll();
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});
