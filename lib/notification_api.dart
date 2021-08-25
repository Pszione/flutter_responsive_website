import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static NotificationDetails platformChannelDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
        priority: Priority.high,
        color: Color(0xFFFFC107),
        channelShowBadge: false,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      await _notifications.show(
        id,
        title,
        body,
        platformChannelDetails(),
        payload: payload,
      );
}
