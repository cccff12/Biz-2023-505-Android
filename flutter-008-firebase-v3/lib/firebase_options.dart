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
    apiKey: 'AIzaSyDsVtdlVBaRcrNn3cIJ8pZohb9FWnx4ptQ',
    appId: '1:457366555778:web:dc5ea41826ae9db762b89b',
    messagingSenderId: '457366555778',
    projectId: 'flutter-my-app-1b681',
    authDomain: 'flutter-my-app-1b681.firebaseapp.com',
    storageBucket: 'flutter-my-app-1b681.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFaYC7WF8ImY2JXOGVp3cKvKSZ4gxJ6eE',
    appId: '1:457366555778:android:1d4e2408d952bf8162b89b',
    messagingSenderId: '457366555778',
    projectId: 'flutter-my-app-1b681',
    storageBucket: 'flutter-my-app-1b681.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgtJSH2_xhJzw_dvDieq8HuxrZyHcOUKM',
    appId: '1:457366555778:ios:baf0ca8435e848f562b89b',
    messagingSenderId: '457366555778',
    projectId: 'flutter-my-app-1b681',
    storageBucket: 'flutter-my-app-1b681.appspot.com',
    iosClientId: '457366555778-5rbo7qd7kjrjrai341fd18epf3phjnu0.apps.googleusercontent.com',
    iosBundleId: 'com.callor.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgtJSH2_xhJzw_dvDieq8HuxrZyHcOUKM',
    appId: '1:457366555778:ios:7ad1d98b5c71f96662b89b',
    messagingSenderId: '457366555778',
    projectId: 'flutter-my-app-1b681',
    storageBucket: 'flutter-my-app-1b681.appspot.com',
    iosClientId: '457366555778-vv0tgm2u4ab79p9rp66mnbgm8rs0fdns.apps.googleusercontent.com',
    iosBundleId: 'com.callor.firebase.RunnerTests',
  );
}
