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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBWB58L4ZZA0lYfPzgVZLG53GwAG7aKHyI',
    appId: '1:899012108615:web:8ef367fcfb6dfe73e42c62',
    messagingSenderId: '899012108615',
    projectId: 'vcec-d7e72',
    authDomain: 'vcec-d7e72.firebaseapp.com',
    storageBucket: 'vcec-d7e72.appspot.com',
    measurementId: 'G-26SK67KLK3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByiAS0cN5meyXaTSsZd6n8ax9f6CmKFYk',
    appId: '1:899012108615:android:1cb03a71bfad3cc9e42c62',
    messagingSenderId: '899012108615',
    projectId: 'vcec-d7e72',
    storageBucket: 'vcec-d7e72.appspot.com',
  );
}
