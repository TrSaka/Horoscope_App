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
    apiKey: 'AIzaSyDmuOak7E50v05yue7HE5hY-JR94pLwPGs',
    appId: '1:183608737870:web:5e542ebca96bb00693431f',
    messagingSenderId: '183608737870',
    projectId: 'horoscope-7ef9a',
    authDomain: 'horoscope-7ef9a.firebaseapp.com',
    storageBucket: 'horoscope-7ef9a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZiXERmavxP2-z95XTInWIgxKzEcKLyxk',
    appId: '1:183608737870:android:742cc2c16df8ee5293431f',
    messagingSenderId: '183608737870',
    projectId: 'horoscope-7ef9a',
    storageBucket: 'horoscope-7ef9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgtmFS738KVxCcpxnWurRc7TWfdnMflec',
    appId: '1:183608737870:ios:134cbf85a2e9cb7893431f',
    messagingSenderId: '183608737870',
    projectId: 'horoscope-7ef9a',
    storageBucket: 'horoscope-7ef9a.appspot.com',
    iosClientId: '183608737870-evau8kcdjfssaqvgtld0jil5eemjhkps.apps.googleusercontent.com',
    iosBundleId: 'com.horoscope.horoscopeProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgtmFS738KVxCcpxnWurRc7TWfdnMflec',
    appId: '1:183608737870:ios:134cbf85a2e9cb7893431f',
    messagingSenderId: '183608737870',
    projectId: 'horoscope-7ef9a',
    storageBucket: 'horoscope-7ef9a.appspot.com',
    iosClientId: '183608737870-evau8kcdjfssaqvgtld0jil5eemjhkps.apps.googleusercontent.com',
    iosBundleId: 'com.horoscope.horoscopeProject',
  );
}
