import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        sound: true,
        provisional: true,
        criticalAlert: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Granted permission");
      SnackBar(
        content: Text("User Granted permission"),
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.endToStart,
      );
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Granted provisional permission");
      SnackBar(
        content: Text("User Granted permission"),
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.endToStart,
      );
    } else {
      print("User denied permission");
      SnackBar(
        content: Text("User Granted permission"),
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.endToStart,
      );
    }
  }

//to show messgae body & title
  void FirebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
    });
  }

//
  void initLocaclNotification() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('defaultIcon');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var InitializedSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(InitializedSetting,
        onDidReceiveNotificationResponse: (payload) {});
  }

//to get device token
  Future<String> getdeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

//to refresh device token if problem occur
  void isTokenrefresh() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('token refrest');
    });
  }
}
