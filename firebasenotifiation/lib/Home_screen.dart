import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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

  Future<String> getdeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }
}
