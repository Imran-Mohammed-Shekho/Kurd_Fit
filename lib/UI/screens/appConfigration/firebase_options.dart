import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCyZCwNUY4OcsJsRgOf6aUoVNo1DNwCx2I',
    appId: '1:880477009342:web:d8dcb0e55dfa3931c035ef',
    messagingSenderId: '880477009342',
    projectId: 'gym-app-0',
    authDomain: 'gym-app-0.firebaseapp.com',
    storageBucket: 'gym-app-0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBn1ZIKaMTVD6nojKB_ut1hs4EncDEk7qA',
    appId: '1:880477009342:android:8590fe791803b0a5c035ef',
    messagingSenderId: '880477009342',
    projectId: 'gym-app-0',
    storageBucket: 'gym-app-0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkXvhVERPd6NoDfB8tJGyqxeCRLUo6phI',
    appId: '1:880477009342:ios:4870d1d9605cc9dbc035ef',
    messagingSenderId: '880477009342',
    projectId: 'gym-app-0',
    storageBucket: 'gym-app-0.firebasestorage.app',
    iosClientId: 'YOUR-IOS-CLIENT-ID',
    iosBundleId: 'com.example.gym',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR-MACOS-API-KEY',
    appId: 'YOUR-MACOS-APP-ID',
    messagingSenderId: '880477009342',
    projectId: 'gym-app-0',
    storageBucket: 'gym-app-0.firebasestorage.app',
    iosClientId: 'YOUR-MACOS-CLIENT-ID',
    iosBundleId: 'com.example.gym',
  );
}
