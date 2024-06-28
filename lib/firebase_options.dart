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
    apiKey: 'AIzaSyBxRR1eXRt64WiDzzuk9vj0g54pB0VEpuc',
    appId: '1:726072268756:web:a5b12fd6b1c5d5a16ba841',
    messagingSenderId: '726072268756',
    projectId: 'sirodaves-agent',
    authDomain: 'sirodaves-agent.firebaseapp.com',
    storageBucket: 'sirodaves-agent.appspot.com',
    measurementId: 'G-B1BJVX2PBM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRaYZK1Z17EyX6braSOLObSDeKbGtW4UU',
    appId: '1:726072268756:android:a670cf5c4e38799b6ba841',
    messagingSenderId: '726072268756',
    projectId: 'sirodaves-agent',
    storageBucket: 'sirodaves-agent.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9QJOd5dlpXd7oTI2KPzMKGxgcS7RxzIs',
    appId: '1:726072268756:ios:a7dff2be3afaa78a6ba841',
    messagingSenderId: '726072268756',
    projectId: 'sirodaves-agent',
    storageBucket: 'sirodaves-agent.appspot.com',
    iosBundleId: 'com.songlib',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9QJOd5dlpXd7oTI2KPzMKGxgcS7RxzIs',
    appId: '1:726072268756:ios:a7dff2be3afaa78a6ba841',
    messagingSenderId: '726072268756',
    projectId: 'sirodaves-agent',
    storageBucket: 'sirodaves-agent.appspot.com',
    iosBundleId: 'com.songlib',
  );
}
