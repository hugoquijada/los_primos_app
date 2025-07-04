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
    apiKey: 'AIzaSyDAkp2AmB07HXib8ShKS0PpeMXoWqui5U0',
    appId: '1:559423514856:web:f24329bcba7f8a28ecc15d',
    messagingSenderId: '559423514856',
    projectId: 'losprimoshmo',
    authDomain: 'losprimoshmo.firebaseapp.com',
    storageBucket: 'losprimoshmo.firebasestorage.app',
    measurementId: 'G-00SFH1W36J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnGo_TDtS6VqNePRCDj7D9Umha0xv_rws',
    appId: '1:559423514856:android:d4a5c6c86c23eec0ecc15d',
    messagingSenderId: '559423514856',
    projectId: 'losprimoshmo',
    storageBucket: 'losprimoshmo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3j6BuL9YpD3Ia2aJo8wjrQWxTWtRMvnA',
    appId: '1:559423514856:ios:7c4f044d92c2c29cecc15d',
    messagingSenderId: '559423514856',
    projectId: 'losprimoshmo',
    storageBucket: 'losprimoshmo.firebasestorage.app',
    iosBundleId: 'com.example.losPrimos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3j6BuL9YpD3Ia2aJo8wjrQWxTWtRMvnA',
    appId: '1:559423514856:ios:7c4f044d92c2c29cecc15d',
    messagingSenderId: '559423514856',
    projectId: 'losprimoshmo',
    storageBucket: 'losprimoshmo.firebasestorage.app',
    iosBundleId: 'com.example.losPrimos',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAkp2AmB07HXib8ShKS0PpeMXoWqui5U0',
    appId: '1:559423514856:web:aa7f19c500cdebe3ecc15d',
    messagingSenderId: '559423514856',
    projectId: 'losprimoshmo',
    authDomain: 'losprimoshmo.firebaseapp.com',
    storageBucket: 'losprimoshmo.firebasestorage.app',
    measurementId: 'G-E2F3PHZPRE',
  );
}
