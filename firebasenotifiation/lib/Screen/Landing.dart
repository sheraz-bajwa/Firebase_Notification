import 'package:firebasenotifiation/Services/services.dart';
import 'package:flutter/material.dart';

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
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Sheraz'),
              subtitle: Text("Bajwa"),
            );
          }),
    );
  }
}
