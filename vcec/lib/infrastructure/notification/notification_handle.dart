import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandle {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  initiateAndListenNotification() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/notification_icon');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        String payload = response.payload ?? "";
        if (payload.isNotEmpty) {
          NotificationHandle().handleNotificationNavigation(
            navigatorKey.currentContext!,
            type: payload,
          );
        }
      },
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
              color: Colors.white,
            ),
          ),
          payload: message.data["type"] ?? "home",
        );
      }
    });
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  handleNotificationNavigation(context, {required String type}) async {
    if (type == 'home') {
      print("mamaaa");
      Navigator.pushNamed(
        context,
        '/home',
      );
    } else if (type == 'examresult') {
      Navigator.pushNamed(
        context,
        '/performance',
      );
    } else if (type == 'leaderboard') {
      Navigator.pushNamed(
        context,
        '/leaderboard',
      );
    } else if (type == 'liveclass') {
      Navigator.pushNamed(
        context,
        '/liveclass',
      );
    } else if (type == 'chat') {
      Navigator.pushNamed(
        context,
        '/chat',
      );
    } else if (type == 'dailyClass') {
      Navigator.pushNamed(
        context,
        '/dailyClass',
      );
    } else if (type == 'profile') {
      Navigator.pushNamed(
        context,
        '/profile',
      );
    } else {
      Navigator.pushNamed(
        context,
        '/home',
      );
    }
  }
}
