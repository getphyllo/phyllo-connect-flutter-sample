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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0oJFH2GRLyrbofYFQPOEX3a6_vYX5nW4',
    appId: '1:127177212994:android:3c1afc967f66c78f6799db',
    messagingSenderId: '127177212994',
    projectId: 'phylloconnect-sdk',
    storageBucket: 'phylloconnect-sdk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB69Ulu5SOgs-3xlR_iw6q40AGdOAkQa0',
    appId: '1:127177212994:ios:24928095231841776799db',
    messagingSenderId: '127177212994',
    projectId: 'phylloconnect-sdk',
    storageBucket: 'phylloconnect-sdk.appspot.com',
    iosClientId: '127177212994-rqof2a2a9pa0l1a2dk60hk1nrv6ul92v.apps.googleusercontent.com',
    iosBundleId: 'com.getphyllo.fluttersample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBB69Ulu5SOgs-3xlR_iw6q40AGdOAkQa0',
    appId: '1:127177212994:ios:69ab23c0f039f3c26799db',
    messagingSenderId: '127177212994',
    projectId: 'phylloconnect-sdk',
    storageBucket: 'phylloconnect-sdk.appspot.com',
    iosClientId: '127177212994-lv9ob58ed8gqeih3cg96vl9t425g78su.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSampleApp',
  );
}
