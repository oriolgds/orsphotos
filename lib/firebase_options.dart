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
    apiKey: 'AIzaSyAcAJNYS3_GlGmVjhvSrvxQebA0Q47KRDE',
    appId: '1:125427961019:web:c3701364f402fbcdcced9e',
    messagingSenderId: '125427961019',
    projectId: 'ors-photos',
    authDomain: 'ors-photos.firebaseapp.com',
    storageBucket: 'ors-photos.appspot.com',
    measurementId: 'G-VD6GM8BBQW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrgHB2NyC_8IT-ax6bzC1mvnRo1TthKpg',
    appId: '1:125427961019:android:0a0d3e23bebeaab9cced9e',
    messagingSenderId: '125427961019',
    projectId: 'ors-photos',
    storageBucket: 'ors-photos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLvNcRd_-HN_Spby1wD0SK2XTPV5Y5OXo',
    appId: '1:125427961019:ios:50724fdaf325fb3fcced9e',
    messagingSenderId: '125427961019',
    projectId: 'ors-photos',
    storageBucket: 'ors-photos.appspot.com',
    iosBundleId: 'com.example.orsphotos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLvNcRd_-HN_Spby1wD0SK2XTPV5Y5OXo',
    appId: '1:125427961019:ios:11b2a1f40eaaacf3cced9e',
    messagingSenderId: '125427961019',
    projectId: 'ors-photos',
    storageBucket: 'ors-photos.appspot.com',
    iosBundleId: 'com.example.orsphotos.RunnerTests',
  );
}
