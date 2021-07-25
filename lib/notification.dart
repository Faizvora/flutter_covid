
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterNotificationPlugin;
  static BehaviorSubject<String> notificationSubject =
      BehaviorSubject<String>();
  static AndroidNotificationDetails androidSettings;
  static initializer() {
    flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
    androidSettings = AndroidNotificationDetails(
        "111", "Test Channel", "Channel to test local notification",
        importance: Importance.high, priority: Priority.max);
    var androidInitialization = AndroidInitializationSettings('app_icon');
    var initializationSetting =
        InitializationSettings(android:androidInitialization);
    flutterNotificationPlugin.initialize(initializationSetting,
        onSelectNotification: onNotificationSelect);
  }

  static Future<void> onNotificationSelect(String payload) async {
    notificationSubject.add(payload);
  }

  static ShowOneTimeNotification(DateTime scheduledDate) async {
    var notificationDetails = NotificationDetails(android:androidSettings);
    await flutterNotificationPlugin.schedule(1, "One time notification",
        "This is a one time notification", scheduledDate, notificationDetails,
        payload: '{"Id":"123","Name":"Testing one time notification"}',
        androidAllowWhileIdle: true);
  }

  static ShowPeriodicNotification(RepeatInterval interval) async {
    var notificationDetails = NotificationDetails(android:androidSettings);
    await flutterNotificationPlugin.periodicallyShow(2, "Alert  🚨 ",
        "Renew RT-PCR Test", interval, notificationDetails,
        payload: '{"Id":"456","Name":"Testing periodic notification"}');
  }

  // static ShowPeriodicNotification(RepeatInterval interval) async {
  //   var notificationDetails = NotificationDetails(android:androidSettings);
  //   await flutterNotificationPlugin.periodicallyShow(2, "Periodic notification",
  //       "This is a periodic notification", interval, notificationDetails,
  //       payload: '{"Id":"456","Name":"Testing periodic notification"}');
  // }

  static CancelNotification(int notificationId) async {
    await flutterNotificationPlugin.cancel(notificationId);
  }
}
