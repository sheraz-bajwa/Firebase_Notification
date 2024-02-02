import 'package:firebasenotifiation/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Landing extends StatefulWidget {
  Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
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
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Sheraz'),
              subtitle: Text("Bajwa"),
            );
          }),
    );
  }
}
