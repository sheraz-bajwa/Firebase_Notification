import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasenotifiation/Screen/Landing.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // To show Notification In Background When app is not open
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandle);
  
  runApp(const MyApp());
}

// To show Notification In Background When app is not open
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandle(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Landing(),
    );
  }
}
