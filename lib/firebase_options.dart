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
    apiKey: 'AIzaSyDnMN_JS0Wq9_S3M84KBXT30P3LEvBjP8A',
    appId: '1:133109444341:web:20e4da6a09602b037a5fbc',
    messagingSenderId: '133109444341',
    projectId: 'flutter-final-exam-ebbee',
    authDomain: 'flutter-final-exam-ebbee.firebaseapp.com',
    storageBucket: 'flutter-final-exam-ebbee.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6KNFVpkwqgKrWMHf4nIZsGBXS8hVqLtc',
    appId: '1:133109444341:android:eca2b9b0115bb54e7a5fbc',
    messagingSenderId: '133109444341',
    projectId: 'flutter-final-exam-ebbee',
    storageBucket: 'flutter-final-exam-ebbee.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBW7qHrTuAyuaIZNmc3zeoSwCl2KG1H5HA',
    appId: '1:133109444341:ios:0030dc597b9a82857a5fbc',
    messagingSenderId: '133109444341',
    projectId: 'flutter-final-exam-ebbee',
    storageBucket: 'flutter-final-exam-ebbee.firebasestorage.app',
    iosBundleId: 'com.example.flutterExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBW7qHrTuAyuaIZNmc3zeoSwCl2KG1H5HA',
    appId: '1:133109444341:ios:0030dc597b9a82857a5fbc',
    messagingSenderId: '133109444341',
    projectId: 'flutter-final-exam-ebbee',
    storageBucket: 'flutter-final-exam-ebbee.firebasestorage.app',
    iosBundleId: 'com.example.flutterExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDnMN_JS0Wq9_S3M84KBXT30P3LEvBjP8A',
    appId: '1:133109444341:web:61bde761d9da1fcc7a5fbc',
    messagingSenderId: '133109444341',
    projectId: 'flutter-final-exam-ebbee',
    authDomain: 'flutter-final-exam-ebbee.firebaseapp.com',
    storageBucket: 'flutter-final-exam-ebbee.firebasestorage.app',
  );
}