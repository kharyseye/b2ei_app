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
    apiKey: 'AIzaSyAUNSiG6WBLH2pAXaiH7vaB4tPwoufyp-Y',
    appId: '1:629330475964:web:1ab48632c40cefa0f189b9',
    messagingSenderId: '629330475964',
    projectId: 'b2ei-app',
    authDomain: 'b2ei-app.firebaseapp.com',
    storageBucket: 'b2ei-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqy6_M3YmypV_2M6zANkXoT-HiagXjjog',
    appId: '1:629330475964:android:cd0c0f24ca2c72a4f189b9',
    messagingSenderId: '629330475964',
    projectId: 'b2ei-app',
    storageBucket: 'b2ei-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqY8DvyPAjMfVqwsSevzUMqs_0KkvAe6g',
    appId: '1:629330475964:ios:a278795467940a36f189b9',
    messagingSenderId: '629330475964',
    projectId: 'b2ei-app',
    storageBucket: 'b2ei-app.appspot.com',
    iosBundleId: 'com.example.b2eiApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqY8DvyPAjMfVqwsSevzUMqs_0KkvAe6g',
    appId: '1:629330475964:ios:0a1a515c44952bf1f189b9',
    messagingSenderId: '629330475964',
    projectId: 'b2ei-app',
    storageBucket: 'b2ei-app.appspot.com',
    iosBundleId: 'com.example.b2eiApp.RunnerTests',
  );
}
