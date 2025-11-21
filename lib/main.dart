import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym/state/providers/appState_Provider.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'UI/screens/appConfigration/firebase_options.dart';
import 'package:gym/UI/screens/appConfigration/GymM.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:gym/state/providers/profile_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LandingscreenProvider()),
        ChangeNotifierProvider(create: (context) => AppstateProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MangeWorkoutsPorovider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const Gym(),
    ),
  );
}

Future<void> initializeFirebase() async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      print('Firebase Initialized');
    }
  } catch (e) {
    print('Firebase init error: $e');
  }
}
