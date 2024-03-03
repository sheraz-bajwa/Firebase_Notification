import 'dart:convert';
// import 'dart:html';

import 'package:firebasenotifiation/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInterctMessageInBackground(context);

    notificationServices.getdeviceToken().then((value) => {
          print('Device Token'),
          print(value),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              notificationServices.getdeviceToken().then((value) async {
                var data = {
                  'to': value.toString(),
                  'priority': 'high',
                  'notification': {
                    'title': 'Sheraz Bajwa',
                    'body': 'Haan Bhai Aya Notification'
                    // 'Authorization': ''daX1zJMWRF6qYNilVnhAcU:APA91bHZ28jvEhGKjkbgDbKvSlkD8NgPavWch8fg3x2Wj5YZgKqjFpgfEfBgWWC0YLJxn1sAQ3NHiHVuXuBRUt6nuAVH6rYYySm2g28JF1h0-t50Tb6SDV4iL65h2j5zTf8IGaPnx5nM
                  },
                  //to redirect to screen
                  'data': {'type': 'msg', 'id': '12345'}
                };
                await http.post(
                    Uri.parse('https://fcm.googleapis.com/fcm/send'),
                    body: jsonEncode(data),
                    headers: {
                      'content-type': 'application/json; charset=UTF-8',
                      'Authorization':
                          'Key=AAAAr092sUw:APA91bGKilG-U7KNpEsbgnnM6h_Tsv2itK_L1IPQeCU0wqzEw0lnEDuxX3GbOBHkTFLWdMMVYQL8lIxvHzKEihRv9VQmU4i9zVhOCrtTSOP35EEKWbhiO6Yergsga1PNhM4Q5QN_IX3v'
                    });
              });
            },
            child: Text('Send Notificstion')),
      ),
    );
  }
}
