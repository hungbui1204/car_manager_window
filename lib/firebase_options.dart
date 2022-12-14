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
    apiKey: 'AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E',
    appId: '1:387750916082:web:01ee70eff0036b9289056b',
    messagingSenderId: '387750916082',
    projectId: 'flutter-car-manager-mobile',
    authDomain: 'flutter-car-manager-mobile.firebaseapp.com',
    databaseURL: 'https://flutter-car-manager-mobile-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-car-manager-mobile.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzOlHt6zBMDkmzuC42RiinXpfM1kZFb_0',
    appId: '1:387750916082:android:78944c68b9f0e36a89056b',
    messagingSenderId: '387750916082',
    projectId: 'flutter-car-manager-mobile',
    databaseURL: 'https://flutter-car-manager-mobile-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-car-manager-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPlTixf9kzAEeZgYW1LklFI9T3cpGDGmo',
    appId: '1:387750916082:ios:50a5b65667fda21289056b',
    messagingSenderId: '387750916082',
    projectId: 'flutter-car-manager-mobile',
    databaseURL: 'https://flutter-car-manager-mobile-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-car-manager-mobile.appspot.com',
    iosClientId: '387750916082-end0eve3pu36lbeg1iiatruaeppccc12.apps.googleusercontent.com',
    iosBundleId: 'com.example.carManagerWindow',
  );
}
