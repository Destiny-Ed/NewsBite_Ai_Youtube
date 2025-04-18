// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD7IFV3va1zdb17TOWVdr6GZHalBaCKfKA',
    appId: '1:870609517670:web:10f69d1506b87242f681a7',
    messagingSenderId: '870609517670',
    projectId: 'news-bite-ai',
    authDomain: 'news-bite-ai.firebaseapp.com',
    storageBucket: 'news-bite-ai.firebasestorage.app',
    measurementId: 'G-JW9FGL3HYN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2FOnvkfZz3xBmzteEr_Amnf4WHkB0pvA',
    appId: '1:870609517670:android:ebe917e20ce7b19ef681a7',
    messagingSenderId: '870609517670',
    projectId: 'news-bite-ai',
    storageBucket: 'news-bite-ai.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5dfsqgiTIPrhfBc78uVnb9CtcN1wnMBM',
    appId: '1:870609517670:ios:94e108aab4d6e6ddf681a7',
    messagingSenderId: '870609517670',
    projectId: 'news-bite-ai',
    storageBucket: 'news-bite-ai.firebasestorage.app',
    iosClientId: '870609517670-uqqbnjr104b59c37hl603al4j30icrj1.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsBiteAi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5dfsqgiTIPrhfBc78uVnb9CtcN1wnMBM',
    appId: '1:870609517670:ios:94e108aab4d6e6ddf681a7',
    messagingSenderId: '870609517670',
    projectId: 'news-bite-ai',
    storageBucket: 'news-bite-ai.firebasestorage.app',
    iosClientId: '870609517670-uqqbnjr104b59c37hl603al4j30icrj1.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsBiteAi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7IFV3va1zdb17TOWVdr6GZHalBaCKfKA',
    appId: '1:870609517670:web:eaf6fdeb716d9589f681a7',
    messagingSenderId: '870609517670',
    projectId: 'news-bite-ai',
    authDomain: 'news-bite-ai.firebaseapp.com',
    storageBucket: 'news-bite-ai.firebasestorage.app',
    measurementId: 'G-LK9GLRTEPB',
  );
}
