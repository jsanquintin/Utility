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
    apiKey: 'AIzaSyAzUQfNk-KuWwhotIHu_fMbMKSVxCObp0A',
    appId: '1:150618686212:web:ef92bdade6cf8cb7458651',
    messagingSenderId: '150618686212',
    projectId: 'utility-463dd',
    authDomain: 'utility-463dd.firebaseapp.com',
    databaseURL: 'https://utility-463dd-default-rtdb.firebaseio.com',
    storageBucket: 'utility-463dd.appspot.com',
    measurementId: 'G-XHFLKLCSK5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFPnibThM5F19c3lWUvjzJ1Ot9_4wGQw0',
    appId: '1:150618686212:android:1b7b677553b2a06d458651',
    messagingSenderId: '150618686212',
    projectId: 'utility-463dd',
    databaseURL: 'https://utility-463dd-default-rtdb.firebaseio.com',
    storageBucket: 'utility-463dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEr-dmhGcey_Gk17vtbhVWaY1Pz4XufY4',
    appId: '1:150618686212:ios:0536c5a8c589ab21458651',
    messagingSenderId: '150618686212',
    projectId: 'utility-463dd',
    databaseURL: 'https://utility-463dd-default-rtdb.firebaseio.com',
    storageBucket: 'utility-463dd.appspot.com',
    iosBundleId: 'com.util.utility',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEr-dmhGcey_Gk17vtbhVWaY1Pz4XufY4',
    appId: '1:150618686212:ios:8c3694a434e5545f458651',
    messagingSenderId: '150618686212',
    projectId: 'utility-463dd',
    databaseURL: 'https://utility-463dd-default-rtdb.firebaseio.com',
    storageBucket: 'utility-463dd.appspot.com',
    iosBundleId: 'com.util.utility.RunnerTests',
  );
}