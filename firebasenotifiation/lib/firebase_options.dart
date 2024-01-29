// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA5hgfldSoILqWCkYBW-8lYkHSToAL1_8U',
    appId: '1:752952455500:web:3926d337901882ef209fe9',
    messagingSenderId: '752952455500',
    projectId: 'calculator-786-fe902',
    authDomain: 'calculator-786-fe902.firebaseapp.com',
    databaseURL: 'https://calculator-786-fe902.firebaseio.com',
    storageBucket: 'calculator-786-fe902.appspot.com',
    measurementId: 'G-NSEF8YD5FK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxay5unETc0K4AYS6ionbXEEC3GxOOsIY',
    appId: '1:752952455500:android:a5ec9ce6b1bb5029209fe9',
    messagingSenderId: '752952455500',
    projectId: 'calculator-786-fe902',
    databaseURL: 'https://calculator-786-fe902.firebaseio.com',
    storageBucket: 'calculator-786-fe902.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3OB54_wkaMVBYtgVpRmfFJGZms97ZkzQ',
    appId: '1:752952455500:ios:c2272c4e669674f6209fe9',
    messagingSenderId: '752952455500',
    projectId: 'calculator-786-fe902',
    databaseURL: 'https://calculator-786-fe902.firebaseio.com',
    storageBucket: 'calculator-786-fe902.appspot.com',
    iosBundleId: 'com.example.firebasenotifiation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3OB54_wkaMVBYtgVpRmfFJGZms97ZkzQ',
    appId: '1:752952455500:ios:24cb315e02799bf5209fe9',
    messagingSenderId: '752952455500',
    projectId: 'calculator-786-fe902',
    databaseURL: 'https://calculator-786-fe902.firebaseio.com',
    storageBucket: 'calculator-786-fe902.appspot.com',
    iosBundleId: 'com.example.firebasenotifiation.RunnerTests',
  );
}
