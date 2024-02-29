import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasenotifiation/Screen/MessageScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
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
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Granted provisional permission");
    } else {
      if (kDebugMode) {
        print("User denied permission");
      }
      const SnackBar(
        content: Text("User Granted permission"),
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.endToStart,
      );
    }
  }

//to show messgae body & title
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());

        print(message.data['type']);
        print(message.data['id']);
      }
      if (Platform.isAndroid) {
        initLocaclNotification(context, message);
        showNotification(message);
      } else {
        showNotification(message);
      }
    });
  }

//To Show notification Function using FlutteerlocalNotification
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(Random.secure().nextInt(1000).toString(),
            'high Importance Notification',
            importance: Importance.max);
//to inialize android setting
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(androidNotificationChannel.id.toString(),
            androidNotificationChannel.name.toString(),
            channelDescription: 'Your chanel description',
            priority: Priority.high,
            ticker: 'ticker');
//to inialize IOS setting

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

// for Set ICon For notification & To make setting for IOS & Andoid
  void initLocaclNotification(
      BuildContext context, RemoteMessage message) async {
    //to give notification icon
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    // to initilize setting for IOS
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      //to redirect from notication to a specific Screen
      handelmessage(context, message);
    });
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

//to redirect from notification to a specific Screen
void handelmessage(BuildContext context, RemoteMessage message) {
  if (message.data['type'] == 'message') {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MessageScreen(
                  id: message.data['id'],
                )));
  }
}
